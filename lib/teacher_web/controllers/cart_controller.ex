defmodule TeacherWeb.CartController do
  use TeacherWeb, :controller

  alias Teacher.Recordings
  alias Teacher.Workers.CartAgent

  def update(%{assigns: %{current_user: current_user}} = conn, %{"id" => id}) do
    album = Recordigs.get_album!(id)
    CartAgent.add_item(current_user.username, album)

    conn
    |> put_flash(:info, "Album added to your cart")
    |> redirect(to: Routes.album_path(conn, :show, album))
  end
end
