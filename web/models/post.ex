defmodule AppsignalPhoenixExample.Post do
  use AppsignalPhoenixExample.Web, :model

  schema "posts" do
    field :title, :string
    belongs_to :user, AppsignalPhoenixExample.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
