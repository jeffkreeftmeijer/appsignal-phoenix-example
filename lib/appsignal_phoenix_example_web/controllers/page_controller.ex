defmodule AppsignalPhoenixExampleWeb.PageController do
  use AppsignalPhoenixExampleWeb, :controller
  use Appsignal.Instrumentation.Decorators

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def overwritten(conn, _params) do
    Appsignal.Transaction.set_action("AppsignalPhoenixExample.OverwrittenController#overwritten")
    render(conn, "index.html")
  end

  def decorators(conn, _params) do
    decorated()

    render(conn, "index.html")
  end

  @decorate transaction_event("function.decorated")
  def decorated() do
    :timer.sleep(1000)
  end
end
