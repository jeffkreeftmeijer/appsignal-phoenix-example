defmodule AppsignalPhoenixExampleWeb.AppsignalPlugExample do
  import Plug.Conn

  def init(options), do: options

  def call(conn, greeting: greeting) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "#{greeting} World!\n")
  end
end
