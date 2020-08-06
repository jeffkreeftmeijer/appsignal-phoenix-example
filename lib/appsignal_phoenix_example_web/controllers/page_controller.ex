defmodule AppsignalPhoenixExampleWeb.PageController do
  use AppsignalPhoenixExampleWeb, :controller

  def index(conn, _params) do
    slow()
    render(conn, "index.html")
  end

  defp slow do
    Appsignal.instrument("slow", "call.slow", fn span ->
      :timer.sleep(1000)
    end)
  end

  def exception(conn, _params) do
    raise "Exception!"
  end
end
