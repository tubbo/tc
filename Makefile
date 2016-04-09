#
# tc build script
#

# Compile tc for use on a Raspberry Pi
all: clean build pkg

# Pull down Elixir dependencies
deps:
	@mix deps.get

# Compile Elixir app
build: deps
	@mix

# Install Bakeware
/usr/local/bin/bake:
	ruby -e "$(curl -fsSL https://bakeware.herokuapp.com/bake/install)"

# Install Nerves
${HOME}/.nerves: ${HOME}/.nerves/systems/nerves/rpi2-0.4.0-rc2 ${HOME}/.nerves/toolchains/nerves-arm-unknown-linux-gnueabihf-darwin-x86_64-v0.6.0

${HOME}/.nerves/systems/nerves/rpi2-0.4.0-rc2: /usr/local/bin/bake
	@bake system get

${HOME}/.nerves/toolchains/nerves-arm-unknown-linux-gnueabihf-darwin-x86_64-v0.6.0: /usr/local/bin/bake
	@bake toolchain get

# Compile the Raspberry Pi 2 firmware that includes this application
pkg: ${HOME}/.nerves pkg/firwmare pkg.tar.gz

pkg/firmware: priv/repo/db.sqlite3 /usr/local/bin/bake /usr/local/bin/bake /usr/local/bin/bake /usr/local/bin/bake
	@bake firmware
	@mkdir -p pkg
	@mv firmware pkg/firmware

pkg.tar.gz:
	@tar -czf pkg/firmware.tar.gz pkg/firmware

# Install the compiled firmware to the Raspberry Pi
install:
	@bake burn

# Install the database
priv/repo/db.sqlite3:
	@mix do ecto.create, ecto.migrate
	@mix run priv/repo/seeds.exs

# Start a local development server.
server: priv/repo/db.sqlite3
	@mix phoenix.server

clean:
	@rm -rf pkg pkg.tar.gz

test: deps
	@mix test

.PHONY: all build install server clean test
