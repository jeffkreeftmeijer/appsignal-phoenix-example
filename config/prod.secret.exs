use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :appsignal_phoenix_example, AppsignalPhoenixExampleWeb.Endpoint,
  secret_key_base: "6qxqLZ1J7wyAAWW71BgRNtflMD9T9jFGrg4AXlrhizLhBti/rEqn1l8EU5jBn3Le"

# Configure your database
config :appsignal_phoenix_example, AppsignalPhoenixExample.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10"),
  ssl: true
