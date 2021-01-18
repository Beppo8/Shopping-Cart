defmodule TeacherWeb.LayoutView do
  use TeacherWeb, :view

  alias Teacher.Carts

  def cart_item_count(current_user) do
    case Carts.get(current_user.username) do
      nil ->
        0
      cart ->
        Enum.count(cart)
    end
  end
end
