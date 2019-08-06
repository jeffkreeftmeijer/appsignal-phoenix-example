defmodule AppsignalPhoenixExample.Job do
  use Ecto.Schema
  import Ecto.Changeset

  alias AppsignalPhoenixExample.Accounts.User

  schema "jobs" do
    field :company_name, :string
    field :title, :string
    belongs_to :user, User
  end
end
