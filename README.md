# tc: temperature control

A headless thermostat controlled by a web application running on the
[Raspberry Pi][].

## Installation

To compile this application:

    git clone https://github.com/tubbo/tc.git
    cd tc
    make

Installing requires that you have your Raspberry Pi plugged in:

    make install

The application should now be burned onto your Raspberry Pi, and
connected to Wi-Fi. Browsing to http://tc.local from your local network
should allow you to view the current temperature. `tc` will have all
systems turned off by default.

## Usage

You can change temperature settings and view the current temperature at
http://tc.local. The web application is designed mobile-first and
responsively enlarges when browsed with a tablet or "regular computer".

## Development

Pull requests (with tests) are always welcome. Although the build
toolchain was designed with OS X users in mind, it should be usable on
any UNIX-based OS that has [Elixir][] and [Bakeware][] installed. The
entire application is written in the Elixir programming language, using
the [Nerves][] toolkit for communicating with the embedded temperature
sensors and wire controls, as well as the [Phoenix][] web framework for
providing the graphical user interface and API.

As mentioned previously, a Raspberry Pi is required for real-world
installation and testing. However, local development and testing can
still be performed using the web application by running the following
command:

    make server

This will launch a web application server on <http://localhost:4000> and
use mocked interfaces to the low-level hardware, so bugs can be fixed in
the UI without needing to recompile on a new device. Typing `Ctrl+C` and
hitting `a` will stop the server if you need to restart it.

[Raspberry Pi]: https://www.raspberrypi.org
[Elixir]: http://elixir-lang.org/
[Bakeware]: http://www.bakeware.io/
[Nerves]: http://nerves-project.org/
[Phoenix]: http://www.phoenixframework.org/
