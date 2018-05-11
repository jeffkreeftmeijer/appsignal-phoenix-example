defmodule AppsignalPhoenixExampleWeb.PageController do
  use AppsignalPhoenixExampleWeb, :controller

  def index(conn, %{"discard" => _}) do
    IO.puts "remove!"

    Appsignal.Transaction.set_action("")
    # self()
    # |> Appsignal.TransactionRegistry.lookup()
    # |> IO.inspect
    # |> Appsignal.TransactionRegistry.remove_transaction()
    # |> IO.inspect

    render conn, "index.html"
  end

  def index(conn, _) do
    render conn, "index.html"
  end
end
