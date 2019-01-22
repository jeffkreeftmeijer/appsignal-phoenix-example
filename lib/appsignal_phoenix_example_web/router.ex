defmodule AppsignalPhoenixExampleWeb.Router do
  use AppsignalPhoenixExampleWeb, :router

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

  scope "/", AppsignalPhoenixExampleWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppsignalPhoenixExampleWeb do
  #   pipe_through :api
  # end
end
