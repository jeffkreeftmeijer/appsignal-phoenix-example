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
    pipe_through :browser # Use the default browser stack

    resources "/users", UserController

    get "/exceptions", ExceptionController, :index
    get "/exceptions/raise", ExceptionController, :raise
    get "/exceptions/exit", ExceptionController, :exit
    get "/exceptions/proc_raise", ExceptionController, :proc_raise
    get "/exceptions/proc_exit", ExceptionController, :proc_exit
    get "/exceptions/timeout", ExceptionController, :timeout
    get "/exceptions/template", ExceptionController, :template
    get "/exceptions/template_error", ExceptionController, :template_error

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppsignalPhoenixExampleWeb do
  #   pipe_through :api
  # end
end
