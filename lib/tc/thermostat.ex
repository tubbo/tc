defmodule Tc.Thermostat do
  @moduledoc """
  Controls heat and air conditioning.
  """

  @app :tc_thermostat

  @systems [
    heat: [],
    cool: []
  ]

  def initialize do
    :ets.new :temperature_control, [:set, :public, :named_table]
  end

  @doc """
  Activate the currently chosen system.
  """
  def activate(system) do
    :ets.insert :temperature_control, [{:on, system}]
  end

  @doc """
  Deactivate the currently chosen system.
  """
  def deactivate(system) do
    :ets.insert :temperature_control, [{:off, system}]
  end
end
