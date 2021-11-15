# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :domain,
  ecto_repos: [Domain.Repo]

config :public,
  generators: [context_app: false]

# Configures the endpoint
config :public, Public.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1F9uGZokUy+D8ZMqPtJNnZ2QIYCD7+s46TRAhqG9tMfF8MKyNnQDYGG1DFI82P+D",
  render_errors: [view: Public.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Public.PubSub,
  live_view: [signing_salt: "mj0aGEGw"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "proxy.exs"
import_config "#{Mix.env()}.exs"
