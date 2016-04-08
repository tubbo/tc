all: deps _build ${HOME}/.nerves/systems/nerves/rpi2-0.4.0-rc2 toolchain firmware ${HOME}/.nerves/toolchains/nerves-arm-unknown-linux-gnueabihf-darwin-x86_64-v0.6.0 database

_build:
	@mix

deps:
	@brew bundle
	@mix deps.get

${HOME}/.nerves/systems/nerves/rpi2-0.4.0-rc2:
	@bake system get

${HOME}/.nerves/toolchains/nerves-arm-unknown-linux-gnueabihf-darwin-x86_64-v0.6.0:
	@bake toolchain get

database:
	@mix do ecto.create, ecto.migrate, ecto.seed

firmware:
	@bake firmware

install:
	@bake burn

clean:
	@bake system clean
	@bake toolchain clean
	@bake firmware clean
	@rm -r _build deps node_modules

.PHONY: all clean firmware install database
