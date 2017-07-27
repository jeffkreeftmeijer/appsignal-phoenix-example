defmodule AppsignalPhoenixExample.RoomChannel do
  use Phoenix.Channel
  use Appsignal.Instrumentation.Decorators
  alias AppsignalPhoenixExample.{Repo, User}

  @decorate channel_action
  def join("room:lobby", _message, socket) do
    Repo.all(User)
    {:ok, socket}
  end
  @decorate channel_action
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
end
