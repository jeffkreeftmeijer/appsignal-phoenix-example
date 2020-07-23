defmodule AppsignalPhoenixExampleWeb.PageController do
  use AppsignalPhoenixExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def exception(conn, _params) do
    raise "Exception!"
  end
end
