defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "save/1" do
    test "Saves the order" do
      order = build(:order)

      OrderAgent.start_link(%{})

      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "when the order is found, returns the order" do
      order = build(:order)

      {:ok, uuid} = OrderAgent.save(order)

      response = OrderAgent.get(uuid)

      expected_response = {:ok, order}

      assert response == expected_response
    end

    test "when the user is not found, returns an error" do
      response = OrderAgent.get("f7ae8802-cdb9-4bad-af29-6ee1216d2f1f")

      expected_response = {:error, "Order not Found"}

      assert response == expected_response
    end
  end
end
