defmodule ExceptionPlug do
  import Plug.Conn

  def init(opts), do: opts

  def call(%{params: %{"exception" => exception}} = conn, _) do
    raise(exception)
    conn
  end
  def call(conn, _) do
    conn
  end
end

defmodule SlowPlugWithInstrumentationHelpers do
  import Plug.Conn
  import Appsignal.Instrumentation.Helpers, only: [instrument: 3]

  def init(opts), do: opts

  def call(%{params: %{"slow" => "helpers"}} = conn, _) do
    instrument("timer.sleep", "Sleeping", fn() ->
      :timer.sleep(1000)
    end)
    conn
  end
  def call(conn, _) do
    conn
  end
end

defmodule SlowPlugWithDecorators do
  import Plug.Conn
  use Appsignal.Instrumentation.Decorators

  def init(opts), do: opts

  @decorate transaction_event()
  def call(%{params: %{"slow" => "decorators"}} = conn, _) do
    :timer.sleep(1000)
    conn
  end
  def call(conn, _) do
    conn
  end
end

defmodule AppsignalPhoenixExampleWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :appsignal_phoenix_example

  socket "/socket", AppsignalPhoenixExampleWeb.UserSocket

  # Serve at "/" the static files from "priv/static" directory.
  #
  # You should set gzip to true if you are running phoenix.digest
  # when deploying your static files in production.
  plug Plug.Static,
    at: "/", from: :appsignal_phoenix_example, gzip: false,
    only: ~w(css fonts images js favicon.ico robots.txt)

  # Code reloading can be explicitly enabled under the
  # :code_reloader configuration of your endpoint.
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  plug Plug.RequestId
  plug Plug.Logger

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  plug Plug.Session,
    store: :cookie,
    key: "_appsignal_phoenix_example_key",
    signing_salt: "S1JKVjSw"

  use Appsignal.Phoenix
  plug ExceptionPlug
  plug SlowPlugWithInstrumentationHelpers
  plug SlowPlugWithDecorators

  plug AppsignalPhoenixExampleWeb.Router

  @doc """
  Callback invoked for dynamically configuring the endpoint.

  It receives the endpoint configuration and checks if
  configuration should be loaded from the system environment.
  """
  def init(_key, config) do
    if config[:load_from_system_env] do
      port = System.get_env("PORT") || raise "expected the PORT environment variable to be set"
      {:ok, Keyword.put(config, :http, [:inet6, port: port])}
    else
      {:ok, config}
    end
  end
end
