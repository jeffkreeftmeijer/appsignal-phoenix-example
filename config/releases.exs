import Config

config :appsignal_phoenix_example, AppsignalPhoenixExampleWeb.Endpoint,
  server: true,
  url: [host: System.get_env("APP_NAME") <> ".gigalixirapp.com", port: 443]
