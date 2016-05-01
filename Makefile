#
# tc build script
#

PREFIX?=/usr/local

# Compile tc for use on a Raspberry Pi
all: clean _images/tc-rpi2.fw

# Remove build artifacts.
clean:
	@rm -rf _images/tc-rpi2.fw

# Pull down Elixir dependencies
deps:
	@mix deps.get

# Compile Elixir app
_build: deps
	@mix

# Install Bakeware
$PREFIX/bin/bake:
	@ruby -e "$(curl -fsSL https://bakeware.herokuapp.com/bake/install)"

# Compile the Raspberry Pi 2 firmware that includes this application
_images/tc-rpi2.fw: ${PREFIX}/bin/bake
	@bake system get
	@bake toolchain get
	@bake firmware

# # Package the firmware into a tarball for distribution.
# pkg/${NAME}-${VERSION}.tar.gz:
# 	@mkdir -p pkg
# 	@tar -czf pkg/${NAME}-${VERSION}.tar.gz firmware

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

# Run all tests.
test: deps
	@mix test

.PHONY: all build clean install server test
