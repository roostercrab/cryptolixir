defmodule Cryptolixir.Repo do
  use Ecto.Repo,
    otp_app: :cryptolixir,
    adapter: Ecto.Adapters.Postgres
end
