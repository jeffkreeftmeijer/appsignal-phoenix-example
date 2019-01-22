use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :appsignal_phoenix_example, AppsignalPhoenixExampleWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :appsignal_phoenix_example, AppsignalPhoenixExample.Repo,
  username: "postgres",
  password: "postgres",
  database: "appsignal_phoenix_example_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
