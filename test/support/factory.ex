defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.Item
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Celestino",
      address: "76377 Batz Forge",
      email: "Keagan81@gmail.com",
      cpf: "12345678900",
      age: 27
    }
  end

  def item_factory do
    %Item{
      description: "pizza de peperoni",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("35.5")
    }
  end
end
