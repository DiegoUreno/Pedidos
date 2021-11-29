defmodule ApiPedidosWeb.PedidoControllerTest do
  use ApiPedidosWeb.ConnCase

  alias ApiPedidos.Pedidos
  alias ApiPedidos.Pedidos.Pedido

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  def fixture(:pedido) do
    {:ok, pedido} = Pedidos.create_pedido(@create_attrs)
    pedido
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pedido", %{conn: conn} do
      conn = get(conn, Routes.pedido_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pedido" do
    test "renders pedido when data is valid", %{conn: conn} do
      conn = post(conn, Routes.pedido_path(conn, :create), pedido: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.pedido_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.pedido_path(conn, :create), pedido: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pedido" do
    setup [:create_pedido]

    test "renders pedido when data is valid", %{conn: conn, pedido: %Pedido{id: id} = pedido} do
      conn = put(conn, Routes.pedido_path(conn, :update, pedido), pedido: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.pedido_path(conn, :show, id))

      assert %{
               "id" => id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pedido: pedido} do
      conn = put(conn, Routes.pedido_path(conn, :update, pedido), pedido: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pedido" do
    setup [:create_pedido]

    test "deletes chosen pedido", %{conn: conn, pedido: pedido} do
      conn = delete(conn, Routes.pedido_path(conn, :delete, pedido))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.pedido_path(conn, :show, pedido))
      end
    end
  end

  defp create_pedido(_) do
    pedido = fixture(:pedido)
    %{pedido: pedido}
  end
end
