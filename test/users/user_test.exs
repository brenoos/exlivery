defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response =
        User.build(
          "Celestino",
          "76377 Batz Forge",
          "Keagan81@gmail.com",
          "12345678900",
          27
        )

      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there invalid params, returns a error" do
      response =
        User.build(
          "Breno jr.",
          "teste Street",
          "breno@email.com",
          "12345678900",
          15
        )

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end
