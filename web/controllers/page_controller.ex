defmodule AppsignalPhoenixExample.PageController do
  use AppsignalPhoenixExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def exception(conn, _params) do
    raise "ecxeption!"
  end
end
