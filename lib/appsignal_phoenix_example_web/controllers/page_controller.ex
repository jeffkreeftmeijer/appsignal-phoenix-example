defmodule AppsignalPhoenixExampleWeb.PageController do
  use AppsignalPhoenixExampleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
    raise "Error raised after render!"
  end
end
