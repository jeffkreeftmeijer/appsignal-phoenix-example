use Mix.Config

config :appsignal, :config,
  otp_app: :appsignal_phoenix_example,
  name: "appsignal_phoenix_example",
  push_api_key: "00000000-0000-0000-0000-000000000000",
  env: Mix.env()
