defmodule AppsignalPhoenixExample.PageController do
  use AppsignalPhoenixExample.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def slow(conn, _params) do
    time = :rand.uniform(3000)
    :timer.sleep(time)

    text conn, "Slept for #{time}ms."
  end

  def exception(_conn, _params) do
    raise("Exception!")
  end

  def timeout(_conn, _params) do
    Task.async(fn -> :timer.sleep(200) end)
    |> Task.await(100)
  end
end
