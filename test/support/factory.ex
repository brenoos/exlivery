defmodule Exlivery.Factory do
  use ExMachina

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
end
