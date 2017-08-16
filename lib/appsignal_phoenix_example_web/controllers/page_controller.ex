defmodule AppsignalPhoenixExampleWeb.PageController do
  use AppsignalPhoenixExampleWeb, :controller
  import Appsignal.Instrumentation.Helpers

  def index(conn, _params) do
    render conn, "index.html"
  end

  def tasks(conn, _params) do
    my_task = fn() ->
      random = :rand.uniform(100)
      :timer.sleep(random)
    end

    tasks = Enum.map(1..100, fn(n) ->
      task("task_#{n}", my_task)
    end)

    Enum.each(tasks, fn(task) ->
      resolve(task)
      IO.puts(".")
    end)

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
