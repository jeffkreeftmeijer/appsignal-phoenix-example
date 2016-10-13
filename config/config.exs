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
config :appsignal_phoenix_example, AppsignalPhoenixExample.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "JHtG9YwEUolel+wP5NJis/m9VG/FidOqnlCEafm7dZOBQG9qFUjEYM5baLiE12oe",
  render_errors: [view: AppsignalPhoenixExample.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AppsignalPhoenixExample.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :appsignal, :config,
  name: :appsignal_phoenix_example,
  push_api_key: "00000000-0000-0000-0000-000000000000"

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
