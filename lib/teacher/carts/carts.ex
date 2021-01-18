defmodule Teacher.Carts do

  alias Teacher.Workers.{CartAgent, CartSupervisor}

  def add(cart_id) do
    if cart_exists?(cart_id) do
      CartAgent.add_item(cart_id, item)
    else
      CartSupervisor.start_child({[item], cart})
    end
  end

  def get(cart_id) do
    if cart_exists?(cart_id) do
      CartAgent.get_cart(cart_id)
    else
      nil
    end
  end

  defp cart_exists?(cart_id) do
    :cart_registry
    |> Registry.lookup(cart_id)
    |> Enum.any?()
  end
end
