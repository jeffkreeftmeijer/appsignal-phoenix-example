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

    get "/exceptions", ExceptionController, :index
    get "/exceptions/raise", ExceptionController, :raise
    get "/exceptions/exit", ExceptionController, :exit
    get "/exceptions/proc_raise", ExceptionController, :proc_raise
    get "/exceptions/proc_exit", ExceptionController, :proc_exit
    get "/exceptions/timeout", ExceptionController, :timeout
    get "/exceptions/template", ExceptionController, :template
    get "/exceptions/template_error", ExceptionController, :template_error
    get "/exceptions/ecto_no_results", ExceptionController, :ecto_no_results
  end

  # Other scopes may use custom stacks.
  # scope "/api", AppsignalPhoenixExampleWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: AppsignalPhoenixExampleWeb.Telemetry
    end
  end
end
