# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :appsignal_phoenix_example,
  ecto_repos: [AppsignalPhoenixExample.Repo]

# Configures the endpoint
config :appsignal_phoenix_example, AppsignalPhoenixExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "NQOOZNyk933pJA2nObSpOy3HG1TEkSykSio5lbs8I6Ua/4SJ4LtTCwInV/SG+SZC",
  render_errors: [view: AppsignalPhoenixExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AppsignalPhoenixExample.PubSub, adapter: Phoenix.PubSub.PG2]

config :appsignal_phoenix_example, AppsignalPhoenixExample.Endpoint,
  instrumenters: [Appsignal.Phoenix.Instrumenter]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phoenix, :template_engines,
  eex: Appsignal.Phoenix.Template.EExEngine,
  exs: Appsignal.Phoenix.Template.ExsEngine

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

import_config "appsignal.exs"
