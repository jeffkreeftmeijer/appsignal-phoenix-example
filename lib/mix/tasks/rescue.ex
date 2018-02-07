defmodule Mix.Tasks.Rescue do
  use Mix.Task

  def run(_) do
    {:ok, _} = Application.ensure_all_started(:appsignal)

    raise "rescue!"
  rescue
    e ->
      stacktrace = System.stacktrace
      Appsignal.send_error(e)
      reraise(e, stacktrace)
  after
    Appsignal.Nif.stop
  end
end
