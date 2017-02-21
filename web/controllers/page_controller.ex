defmodule AppsignalPhoenixExample.PageController do
  use AppsignalPhoenixExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def exception(_conn, _params) do
    raise "exception!"
  end

  def session(conn, _params) do
    conn = put_session(conn, :time, Time.utc_now())
    text(conn, inspect conn.private[:plug_session])
  end
end
