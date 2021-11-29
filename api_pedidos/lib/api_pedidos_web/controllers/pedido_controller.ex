defmodule ApiPedidosWeb.PedidoController do
  use ApiPedidosWeb, :controller

  alias ApiPedidos.Pedidos


  action_fallback ApiPedidosWeb.FallbackController



  def show(conn, %{"id_pedido" => id}) do
    pedido = Pedidos.get_pedido(id)
    render(conn, "show.json", pedido: pedido)
  end




end
