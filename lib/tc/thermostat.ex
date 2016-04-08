defmodule Tc.Thermostat do
  @moduledoc """
  Controls heat and air conditioning by sending 24v signal pulses to the
  colored wires that control the HVAC system.
  """

  @port [
    heat: 1234,
    cool: 5678
  ]

  @wire [
    :red, # power supply
    :yellow, # compressor control
    :blue, # common TODO: ???
    :orange, # reversing valve control
    :green, # fan control
    #:white, # aux/emergency heat control
  ]

  @modes [
    fan: [:green],
    cooling: [:green, :orange, :yellow],
    #heating_compressor: [:green, :yellow],
    #heating_aux: [:green, :white],
    heating: [:green, :yellow]
  ]

  @options [
    :binary,
    packet: :line,
    active: false,
    reuseaddr: true
  ]

  @doc """
  Activate the currently chosen system.
  """
  def activate(system) do
    :gen_tcp.send(socket(system), 0x00001)
  end

  @doc """
  Deactivate the currently chosen system.
  """
  def deactivate(system) do
    :gen_tcp.send(socket(system), 0x00000)
  end

  defp socket(system) do
    {:ok, socket} = :gen_tcp.listen(@port[system], @options)
    socket
  end
end
