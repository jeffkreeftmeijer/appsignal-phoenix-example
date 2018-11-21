defmodule AppsignalPhoenixExampleWeb.ExceptionController do
  use AppsignalPhoenixExampleWeb, :controller

  def index(conn, _) do
    render conn, "index.html"
  end

  def raise(conn, _) do
    raise "Exception!"
  end

  def exit(conn, _) do
    exit(:exit)
  end
end

