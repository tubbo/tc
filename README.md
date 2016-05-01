# tc: temperature control

A headless thermostat controlled by a web application running on the
[Raspberry Pi][].

## Installation

`tc` uses the [Nerves][] framework and [Bakeware][] to build firmware
for and burn said firmware onto your Raspberry Pi device. These
components only require the [Elixir][] programming language runtime to
be installed. If you're on OS X, run the following command before
installing anything, if you don't already have Elixir installed:

    brew install elixir

To begin installing `tc`, clone down the repository:

    git clone https://github.com/tubbo/tc.git && cd tc

`tc` is headless and operates entirely off of a web application. To
connect it to your Wi-Fi network, you must set the following environment
variables:

    export WIFI_NAME='wonderland'
    export WIFI_PASSWORD='[REDACTED]'

Then, run the following command to compile the Elixir application for
your Raspberry Pi:

    make

Now, plug in your Raspberry Pi. After it's plugged in, run the following
command to install the `tc` firmware onto your device:

    make install

Once installed, the application will immediately connect to the chosen
Wi-Fi network. The light on your device will turn green when it has
successfully connected to Wi-Fi. Go to http://tc.local to ensure that
the right temperature is being read. All systems are turned off by
default.

## Usage

You can change temperature settings and view the current temperature at
http://tc.local. The web application is designed mobile-first and
responsively enlarges when browsed with a tablet or "regular computer".

## Development

Building for your device does not necessarily install the app locally.
In order to run the web application locally, without connecting to an
actual device, run the following command from inside your cloned repo:

    make server

This will start a server at <http://localhost:4000> ready to run tc's
user interface. Actual systems that would control cooling, heat, and
temperature sensing are mocked out so developers can work on UI bugs
without needing a test machine.

Contributions will only be accepted if they don't fail the build and are
accompanied by tests reflecting their changes. You can also run tests
locally without needing to build the firmware, by running this command:

    make test

This will build the Elixir application locally and perform a `mix test`
command, running all automated unit and feature tests.

### Releasing

Releases are built and compiled automatically on new Git tag pushes by
[Travis CI][]. A "release" constitutes the built and compiled firmware
for a given tag, and is uploaded to [GitHub Releases][] automatically
after a successful build of a tag push.

[Raspberry Pi]: https://www.raspberrypi.org
[Elixir]: http://elixir-lang.org/
[Bakeware]: http://www.bakeware.io/
[Nerves]: http://nerves-project.org/
[Phoenix]: http://www.phoenixframework.org/
