defmodule AppsignalPhoenixExampleWeb.PageController do
  use AppsignalPhoenixExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def json(conn, params) do
    render(conn, "index.json", params: params)
  end
end
