defmodule Cryptolixir.UserPass do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_pass" do
    field(:username, :string)
    field(:password, :string)
    field(:site, :string)

    timestamps()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:username, :password, :site])
    |> validate_required([:username, :password])
  end
end
