defmodule ApiPedidos.PedidosTest do
  use ApiPedidos.DataCase

  alias ApiPedidos.Pedidos

  describe "pedido" do
    alias ApiPedidos.Pedidos.Pedido

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def pedido_fixture(attrs \\ %{}) do
      {:ok, pedido} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pedidos.create_pedido()

      pedido
    end

    test "list_pedido/0 returns all pedido" do
      pedido = pedido_fixture()
      assert Pedidos.list_pedido() == [pedido]
    end

    test "get_pedido!/1 returns the pedido with given id" do
      pedido = pedido_fixture()
      assert Pedidos.get_pedido!(pedido.id) == pedido
    end

    test "create_pedido/1 with valid data creates a pedido" do
      assert {:ok, %Pedido{} = pedido} = Pedidos.create_pedido(@valid_attrs)
    end

    test "create_pedido/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pedidos.create_pedido(@invalid_attrs)
    end

    test "update_pedido/2 with valid data updates the pedido" do
      pedido = pedido_fixture()
      assert {:ok, %Pedido{} = pedido} = Pedidos.update_pedido(pedido, @update_attrs)
    end

    test "update_pedido/2 with invalid data returns error changeset" do
      pedido = pedido_fixture()
      assert {:error, %Ecto.Changeset{}} = Pedidos.update_pedido(pedido, @invalid_attrs)
      assert pedido == Pedidos.get_pedido!(pedido.id)
    end

    test "delete_pedido/1 deletes the pedido" do
      pedido = pedido_fixture()
      assert {:ok, %Pedido{}} = Pedidos.delete_pedido(pedido)
      assert_raise Ecto.NoResultsError, fn -> Pedidos.get_pedido!(pedido.id) end
    end

    test "change_pedido/1 returns a pedido changeset" do
      pedido = pedido_fixture()
      assert %Ecto.Changeset{} = Pedidos.change_pedido(pedido)
    end
  end
end
