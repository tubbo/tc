defmodule Tc.Router do
  use Tc.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Tc do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", Tc do
    pipe_through :api

    resources "/temperature", TemperatureController, only: [:create]
  end
end
