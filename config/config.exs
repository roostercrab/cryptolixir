import Config

config :cryptolixir, Cryptolixir.Repo,
  database: "cryptolixir_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :cryptolixir,
  ecto_repos: [Cryptolixir.Repo]
