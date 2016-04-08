defmodule Tc.Thermometer do
  # @current_temperature 0

  # alias Tc.Temperature
  # alias Tc.Thermostat

  # def start(_type, _args) do
  #   desired_temperature = Repo.get!(Temperature, 1)
  #   spawn fn -> compare(desired_temperature)
  #   {:ok, self}
  # end

  # def compare(desired_temperature) do
  #   if desired_temperature.degrees != current_temperature
  #     Thermostat.activate(desired_temperature.system)
  #   else
  #     Thermostat.decativate(desired_temperature.system)
  #   end
  # end
end
