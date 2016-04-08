defmodule Tc.Thermometer do
  @moduledoc """
  Receives signals when temperature changes.
  """

  def start(_type, _args) do
  end

  def change(temperature) do
    if temperature do
      Tc.Thermostat.heat_on
    else
      Tc.Thermostat.heat_off
    end
  end
end
