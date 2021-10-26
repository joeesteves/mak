defmodule MakWeb.Guardian.AuthErrorHandler do
  import Phoenix.Controller, only: [put_flash: 3, redirect: 2]

  def auth_error(conn, {_type, _reason}, _opts) do
    # JSON RESPONSE 401
    # body = Poison.encode!(%{message: to_string(type)})
    # send_resp(conn, 401, body)
    conn
    |> put_flash(:error, "☠ Area Restringida ☠")
    |> redirect(to: MakWeb.Router.Helpers.session_path(conn, :new))
  end
end
