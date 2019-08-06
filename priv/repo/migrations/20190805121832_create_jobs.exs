defmodule AppsignalPhoenixExample.Repo.Migrations.CreateJobs do
  use Ecto.Migration

  def change do
    create table(:jobs) do
      add(:company_name, :string)
      add(:title, :string)
      add(:user_id, references(:users))
    end
  end
end
