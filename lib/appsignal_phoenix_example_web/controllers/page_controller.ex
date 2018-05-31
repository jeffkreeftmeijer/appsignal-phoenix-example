defmodule AppsignalPhoenixExampleWeb.PageController do
  use AppsignalPhoenixExampleWeb, :controller

  def index(conn, %{foo: "bar"}) do
    render conn, "index.html"
  end
end
