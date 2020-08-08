defmodule Cryptolixir.Repo.Migrations.CreatePasswordTable do
  use Ecto.Migration

  def change do
    create table(:user_pass) do
      add(:username, :string)
      add(:password, :string)
      add(:site, :string)

      timestamps()
    end
  end
end
