defmodule AppsignalPhoenixExampleWeb.ClockLive do
  use Phoenix.LiveView
  import Appsignal.Instrumentation.Helpers, only: [instrument: 4]

  def render(assigns) do
    AppsignalPhoenixExampleWeb.ClockView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    transaction =
      Appsignal.Transaction.generate_id()
      |> Appsignal.Transaction.start(:liveview)
      |> Appsignal.Transaction.set_action("AppsignalPhoenixExampleWeb.ClockLive#mount")

    :timer.send_interval(1000, self(), :tick)

    new_socket =
      instrument(transaction, "query.time", "Getting current time", fn ->
        assign(socket, state: Time.utc_now())
      end)

    Appsignal.Transaction.finish(transaction)
    Appsignal.Transaction.complete(transaction)

    {:ok, new_socket}
  end

  def handle_info(:tick, socket) do
    transaction =
      Appsignal.Transaction.generate_id()
      |> Appsignal.Transaction.start(:liveview)
      |> Appsignal.Transaction.set_action("AppsignalPhoenixExampleWeb.ClockLive#tick")

    new_socket =
      instrument(transaction, "query.time", "Getting current time", fn ->
        assign(socket, state: Time.utc_now())
      end)

    Appsignal.Transaction.finish(transaction)
    Appsignal.Transaction.complete(transaction)

    {:noreply, new_socket}
  end
end
