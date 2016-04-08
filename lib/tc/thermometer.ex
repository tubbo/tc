defmodule Tc.Thermometer do
  @moduledoc """
  Senses temperature using the DS18B20 and reports the current degrees
  in Fahrenheit.
  """

  alias Tc.Temperature
  alias Tc.Thermostat
  alias Tc.Repo

  def start(_type, _args) do
    desired = Repo.get! Temperature, 1

    if current_temperature == desired.degrees do
      Thermostat.deactivate desired.system
    else
      Thermostat.activate desired.system
    end
  end

  def current_temperature do
    device_file = File.read! "/sys/bus/w1/devices/28XXX"
    lines = String.split device_file, "\n"
    status = lines[0]

    if status == 'YES' do
      lines[1]
    else
      0
    end
  end
end
