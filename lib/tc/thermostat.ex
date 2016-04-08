defmodule Tc.Thermostat do
  @moduledoc """
  Controls heat and air conditioning.
  """

  @app :tc_thermostat

  @systems [
    heat: [],
    cool: []
  ]

  @doc """
  Activate the currently chosen system.
  """
  def activate(system) do
  end

  @doc """
  Deactivate the currently chosen system.
  """
  def deactivate(system) do
  end
end
