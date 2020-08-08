defmodule Cryptolixir.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Cryptolixir.Worker.start_link(arg)
      # {Cryptolixir.Worker, arg}
      {Cryptolixir.Repo, []}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Cryptolixir.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
