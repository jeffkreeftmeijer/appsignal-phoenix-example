defmodule AppsignalPhoenixExampleWeb.RoomChannel do
  use Phoenix.Channel

  def join("room:lobby", _message, socket) do
    {:ok, socket}
  end

  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end

  def handle_in("new_msg", %{"body" => body} = params, socket) do
    Appsignal.Phoenix.Channel.instrument(__MODULE__, "new_msg", params, socket, fn ->
      broadcast!(socket, "new_msg", %{body: body})
      :timer.sleep(1_000)
      {:noreply, socket}
    end)
  end
end
