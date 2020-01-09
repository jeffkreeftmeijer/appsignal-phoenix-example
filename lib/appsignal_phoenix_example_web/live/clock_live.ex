defmodule AppsignalPhoenixExampleWeb.ClockLive do
  use Phoenix.LiveView

  def render(assigns) do
    AppsignalPhoenixExampleWeb.ClockView.render("index.html", assigns)
  end

  def mount(_session, socket) do
    :timer.send_interval(1000, self(), :tick)

    {:ok, assign(socket, state: Time.utc_now())}
  end

  def handle_info(:tick, socket) do
    {:noreply, assign(socket, state: Time.utc_now())}
  end
end
