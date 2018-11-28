defmodule AppsignalPhoenixExampleWeb.ExceptionController do
  use AppsignalPhoenixExampleWeb, :controller

  def index(conn, _) do
    render(conn, "index.html")
  end

  def raise(conn, _) do
    raise "Exception!"
  end

  def exit(conn, _) do
    exit(:exit)
  end

  def proc_raise(conn, _) do
    :proc_lib.spawn(fn ->
      raise "Exception!"
    end)

    text(conn, "ok!")
  end

  def proc_exit(conn, _) do
    :proc_lib.spawn(fn ->
      exit(:exit)
    end)

    text(conn, "ok!")
  end

  def timeout(conn, _) do
    Task.async(fn -> :timer.sleep(10) end) |> Task.await(1)

    text(conn, "ok!")
  end

  def template(conn, _) do
    render(conn, "undef.html")
  end

  def template_error(conn, _) do
    render(conn, "error.html")
  end
end
