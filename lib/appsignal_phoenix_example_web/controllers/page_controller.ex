defmodule AppsignalPhoenixExampleWeb.PageController do
  use AppsignalPhoenixExampleWeb, :controller

  def index(conn, _) do
    render conn, "index.html"
  end
end
