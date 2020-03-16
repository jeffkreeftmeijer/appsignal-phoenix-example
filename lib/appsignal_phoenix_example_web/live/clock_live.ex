defmodule AppsignalPhoenixExampleWeb.ClockLive do
  use Phoenix.LiveView
  import Appsignal.Instrumentation.Helpers, only: [instrument: 3]

  def render(assigns) do
    AppsignalPhoenixExampleWeb.ClockView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    new_socket =
      Appsignal.Phoenix.LiveView.live_view_action(__MODULE__, :mount, socket, fn ->
        :timer.send_interval(1000, self(), :tick)

        instrument("query.time", "Getting current time", fn ->
          assign(socket, state: Time.utc_now())
        end)
      end)

    {:ok, new_socket}
  end

  def handle_info(:tick, socket) do
    new_socket =
      Appsignal.Phoenix.LiveView.live_view_action(__MODULE__, :tick, socket, fn ->
        instrument("query.time", "Getting current time", fn ->
          assign(socket, state: Time.utc_now())
        end)
      end)

    {:noreply, new_socket}
  end
end
