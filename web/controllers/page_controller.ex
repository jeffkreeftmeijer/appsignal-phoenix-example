defmodule VerySpecificError do
  defexception message: "ignored!"
end

defmodule AppsignalPhoenixExample.PageController do
  use AppsignalPhoenixExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def exception(conn, _params) do
    raise "ecxeption!"
  end

  def exception2(conn, _params) do
    raise VerySpecificError
  end
end
