defmodule AppsignalPhoenixExample.RoomChannel do
  use Phoenix.Channel
  use Appsignal.Instrumentation.Decorators

  @decorate channel_action
  def join("room:lobby", _message, socket) do
    Backend.fetch()
    {:ok, socket}
  end
  @decorate channel_action
  def join("room:" <> _private_room_id, _params, _socket) do
    {:error, %{reason: "unauthorized"}}
  end
end

defmodule Query do
  import Ecto.Query

  def for_id(queryable, id) do
    from m in queryable, where: m.id == ^id
  end
end

defmodule Backend do
  alias AppsignalPhoenixExample.{Repo, User}
  import Query

  def fetch do
    User
    |> for_id(1)
    |> Repo.all
  end
end
