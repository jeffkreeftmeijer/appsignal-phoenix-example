use Mix.Config

config :appsignal, :config,
  name: "appsignal-phoenix-example",
  push_api_key: "9011f432-6d6b-4f3e-8ca1-cd904970792a",
  active: true,
  env: Mix.env()
