defmodule TeacherWeb.LayoutView do
  use TeacherWeb, :view

  alias Teacher.Workers.CartAgent

  def cart_item_count(current_user) do
    case CartAgent.get_cart(current_user.username) do
      nil ->
        0
      cart ->
        Enum.count(cart)
    end
  end
end
