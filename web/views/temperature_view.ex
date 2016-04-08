defmodule Tc.TemperatureView do
  use Tc.Web, :view

  alias Tc.Thermometer

  def render("index.json", %{temperature: temperature}) do
    %{data: render_many(temperature, Tc.TemperatureView, "temperature.json")}
  end

  def render("show.json", %{temperature: temperature}) do
    %{data: render_one(temperature, Tc.TemperatureView, "temperature.json")}
  end

  def render("temperature.json", %{temperature: temperature}) do
    %{
      desired: temperature.degrees,
      current: Thermometer.current_temperature,
      system: temperature.system or 'off',
    }
  end
end
