use Mix.Config

config :appsignal, :config,
  name: "appsignal-phoenix-example",
  push_api_key: "00000000-0000-0000-0000-000000000000",
  request_headers: ~w(
    accept accept-charset accept-encoding accept-language cache-control
    connection content-length path-info range request-method request-uri
    server-name server-port server-protocol
  ),
  env: Mix.env
