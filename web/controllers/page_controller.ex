defmodule Tc.PageController do
  use Tc.Web, :controller

  def index(conn, _params) do
    temperature = Repo.get!(Temperature, 1)
    render conn, "index.html", desired_temperature: temperature
  end
end
