defmodule AppsignalPhoenixExampleWeb.PageController do
  use AppsignalPhoenixExampleWeb, :controller
  import Appsignal.Instrumentation.Helpers

  def index(conn, _params) do
    render conn, "index.html"
  end

  def tasks(conn, _params) do
    my_task = fn() ->
      random = :rand.uniform(1000)
      :timer.sleep(random)
    end

    one = task("one", my_task)
    two = task("two", my_task)
    three = task("three", my_task)

    resolve(one)
    resolve(two)
    resolve(three)

    text conn, "Done!"
  end

  defp task(task_name, task_fn) do
    pid = self()

    Task.async(fn ->
      instrument(pid, "product_detail_service.#{task_name}", "", task_fn)
    end)
  end

  defp resolve(task) do
    Task.yield(task) || Task.shutdown(task)
  end
end
