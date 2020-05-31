defmodule ViewFormsWeb.Router do
  use ViewFormsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", ViewFormsWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/add_venue", PageController, :add_venue_form
    post "/add_venue", PageController, :add_venue_handler
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ViewFormsWeb.Telemetry
    end
  end
end
