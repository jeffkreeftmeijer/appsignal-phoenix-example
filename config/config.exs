# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :appsignal_phoenix_example,
  ecto_repos: [AppsignalPhoenixExample.Repo]

# Configures the endpoint
config :appsignal_phoenix_example, AppsignalPhoenixExampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "D6oEilHOXSI4Py8RGEjLYTug73Idz/Q3ZMYA7yUsSF7Pw5JCd5oJuKYWiINasxEx",
  render_errors: [view: AppsignalPhoenixExampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AppsignalPhoenixExample.PubSub,
           adapter: Phoenix.PubSub.PG2],
  instrumenters: [Appsignal.Phoenix.Instrumenter]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :template_engines,
  eex: Appsignal.Phoenix.Template.EExEngine,
  exs: Appsignal.Phoenix.Template.ExsEngine

config :appsignal_phoenix_example, AppsignalPhoenixExample.Repo,
  loggers: [Appsignal.Ecto, Ecto.LogEntry]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

import_config "appsignal.exs"
