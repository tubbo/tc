#
# tc build script
#

# Compile tc for use on a Raspberry Pi
all: deps build ${HOME}/.nerves/systems/nerves/rpi2-0.4.0-rc2 ${HOME}/.nerves/toolchains/nerves-arm-unknown-linux-gnueabihf-darwin-x86_64-v0.6.0 priv/repo/db.sqlite3 firmware

# Pull down Elixir dependencies
deps:
	@mix deps.get

# Compile Elixir app
build:
	@mix

# Install the Raspberry Pi system
${HOME}/.nerves/systems/nerves/rpi2-0.4.0-rc2:
	@bake system get

# Install the Raspberry Pi 2 toolchain
${HOME}/.nerves/toolchains/nerves-arm-unknown-linux-gnueabihf-darwin-x86_64-v0.6.0:
	@bake toolchain get

# Install the database
priv/repo/db.sqlite3:
	@mix do ecto.create, ecto.migrate

# Compile the Raspberry Pi 2 firmware that includes this application
firmware:
	@bake firmware

# Install the compiled firmware to the Raspberry Pi
install:
	@bake burn

# Start a local development server.
server: deps _build database
	@mix phoenix.server

.PHONY: all deps build firmware install db/tc.sqlite3 server
