defmodule AppsignalPhoenixExample.Router do
  use AppsignalPhoenixExample.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AppsignalPhoenixExample do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    post "/", PageController, :index
    get "/slow", PageController, :slow
    get "/exception", PageController, :exception
    get "/timeout", PageController, :timeout
    get "/decorator", PageController, :decorator
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppsignalPhoenixExample do
  #   pipe_through :api
  # end
end
