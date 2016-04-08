defmodule Tc.TemperatureView do
  use Tc.Web, :view

  def render("index.json", %{temperature: temperature}) do
    %{data: render_many(temperature, Tc.TemperatureView, "temperature.json")}
  end

  def render("show.json", %{temperature: temperature}) do
    %{data: render_one(temperature, Tc.TemperatureView, "temperature.json")}
  end

  def render("temperature.json", %{temperature: temperature}) do
    %{id: temperature.id,
      degrees: temperature.degrees}
  end
end
