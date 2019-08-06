defmodule AppsignalPhoenixExample.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias AppsignalPhoenixExample.Job

  schema "users" do
    field :name, :string
    has_many :jobs, Job

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
