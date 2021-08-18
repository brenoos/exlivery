defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Frances",
        address: "236 Elwyn Plaza",
        email: "Reta.Lind10@yahoo.com",
        cpf: "68765412345",
        age: 30
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated Successfully"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Frances",
        address: "236 Elwyn Plaza",
        email: "Reta.Lind10@yahoo.com",
        cpf: "68765412345",
        age: 5
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid Parameters"}

      assert response == expected_response
    end
  end
end
