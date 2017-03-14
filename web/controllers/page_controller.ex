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

  def instrumentation(conn, params) do
    time = :rand.uniform(3000)

    result = Appsignal.Instrumentation.Helpers.instrument("sleep.timer", "Some slow backend call", fn() ->
      :timer.sleep(time)
    end

    text conn, "Slept for #{time}ms."
  end
end
