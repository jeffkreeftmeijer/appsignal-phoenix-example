defmodule AppsignalPhoenixExample.RandomNumberProbe do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    Process.send(self(), :work, [])

    {:ok, state}
  end

  def handle_info(:work, state) do
    number = :random.uniform(100)
    IO.puts "* SENDING RANDOM NUMBER (#{number})"
    Appsignal.set_gauge("random_number", number)

    Process.send_after(self(), :work, 60_000)

    {:noreply, state}
  end
end
