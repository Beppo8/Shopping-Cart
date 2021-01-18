defmodule TeacherWeb.AlbumView do
  use TeacherWeb, :view
  import Scrivener.HTML

  alias Teacher.Workers.CartAgent

  def cart_link(conn, current_user, album) do
    if in_cart?(current_user.username, album.id) do
      link "Remove from cart", to: Routes.cart_path(conn, :delete, album.id), method: :delete
    else
      link "Add to cart", to: Routes.cart_path(conn, :update, album.id), method: :put
    end
  end

  defp in_cart?(username, album_id) do
    username
    |> existing_ids()
    |> Enum.member?(album_id)
  end

  defp existing_ids(username) do
    case CartAgent.get_cart(username) do
      nil ->
        []
      cart ->
        Enum.map(cart, &(&1.id))
    end
  end

end
