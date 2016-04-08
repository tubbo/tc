defmodule Tc.Thermometer do
  alias Tc.Temperature
  alias Tc.Thermostat

  @moduledoc """
  Receives signals when temperature changes.
  """

  def initialize do
    :ets.new :current_temperature
  end

  def start(_type, _args) do
    desired_temperature = Repo.get!(Temperature, 1)
    spawn fn -> compare(desired_temperature)
  end

  @doc """
  Return the current temperature.
  """
  def current_temperature do
    :ets.get :current_temperature
  end

  @doc """
  Compare the desired Temperature with the current amount and elect to
  either activate or deactivate the currently chosen system.
  """
  def compare(desired_temperature) do
    if desired_temperature.degrees != current_temperature do
      Thermostat.activate desired_temperature.system
    else
      Thermostat.decativate desired_temperature.system
    end
  end
end
