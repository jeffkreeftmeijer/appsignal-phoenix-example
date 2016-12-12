defmodule AppsignalPhoenixExample.PageController do
  use AppsignalPhoenixExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def exception(conn, _params) do
    raise "ecxeption!"
  end

  def send_error(conn, _params) do
    Appsignal.send_error(%RuntimeError{message: "testing"}, "Testing", nil, %{foo: 3, bar: :baz}) 
    render conn, "index.html"
  end
end
