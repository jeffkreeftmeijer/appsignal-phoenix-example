defmodule AppsignalPhoenixExample.SampleController do
  use AppsignalPhoenixExample.Web, :controller

  def test(conn, _rams) do
    confirmation_required_response(conn, email: "test@example.com")
  end

  defp confirmation_required_response(conn, email: email) do
    msg = AppsignalPhoenixExample.SampleView.render("_confirmation_required_message.html", conn: conn, email: email)
    IO.inspect msg

    conn
    |> put_flash(:error, msg)
    |> redirect(to: "/")
  end
end
