defmodule AppsignalPhoenixExample.Repo.Migrations.UpdateUsers do
  use Ecto.Migration

  alias AppsignalPhoenixExample.Repo
  alias AppsignalPhoenixExample.User

  def change do
    Repo.update_all(User, set: [name: "Alice"])
  end
end
