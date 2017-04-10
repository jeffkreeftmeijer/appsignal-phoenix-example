defmodule AppsignalPhoenixExample.PageController do
  use AppsignalPhoenixExample.Web, :controller
  use Appsignal.Instrumentation.Decorators

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

  def decorator(conn, _params) do
    text conn, "Slept for #{decorated()}ms."
  end

  @decorate transaction_event()
  defp decorated do
    time = :rand.uniform(3000)
    :timer.sleep(time)
    time
  end
end
