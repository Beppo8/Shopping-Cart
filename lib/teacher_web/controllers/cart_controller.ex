defmodule TeacherWeb.CartController do
  use TeacherWeb, :controller

  alias Teacher.{Carts, Recordings}
  alias Teacher.Workers.CartAgent

  def update(%{assigns: %{current_user: current_user}} = conn, %{"id" => id}) do
    album = Recordigs.get_album!(id)
    Carts.add(current_user.username, album)

    conn
    |> put_flash(:info, "Album added to your cart")
    |> redirect(to: Routes.album_path(conn, :show, album))
  end

  def delete(%{assigns: %{current_user: current_user}} = conn, %{"id" => id}) do
    album = Recordings.get_album!(id)
    CartAgent.delete_item(current_user.username, album.id)

    conn
    |> put_flash(:info, "Album removed from your cart")
    |> redirect(to: Routes.album_path(conn, :show, album))
  end
end
