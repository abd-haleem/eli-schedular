# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config
import Config

config :quantum,
  ecto_repos: [Quantum.Repo]

# Configures the endpoint
config :quantum, QuantumWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "mOV8EZ19qKL285/spypjSYojBhm/fzTrp9t+KuK1nWUfx4WdJEbCGgsqYdUk6WsX",
  render_errors: [view: QuantumWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Quantum.PubSub,
  live_view: [signing_salt: "RhOOLB3I"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :schedular, Quantum.Quantum,
  # debug_logging: false,
  jobs: [
    {{:extended, "* * * * * *"}, {IO, :puts, ["Haleem: HI Rey"]}}, # Every second
    {{:extended, "*/3 * * * * *"}, {IO, :puts, ["Rey: Yeeeee hello"]}}, # Every 3 second
    {"* * * * *", fn -> IO.puts("Rey: Mah Man!") end}, # Every minute
    {"@minutely", fn -> IO.puts("Sam: WAZZZAP Gucci Gang") end}, # Every minute
    {"47 * * * *", fn -> IO.puts("Hello odd guys") end} # at __:29
  ]
