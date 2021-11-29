defmodule ApiPedidosWeb.PedidoView do
  use ApiPedidosWeb, :view
  alias ApiPedidosWeb.PedidoView

  def render("show.json", %{pedido: pedido}) do
    %{data: render_many(pedido, PedidoView, "pedido.json")}
  end



  def render("pedido.json", %{pedido: pedido}) do
    %{
      id: pedido.id,
      fecha: pedido.fecha,
      monto: pedido.monto,
      monto_pedido: pedido.monto_pedido,
      cantidad: pedido.cantidad,
      producto: pedido.producto,
      proveedor: pedido.proveedor,
    }
  end
end
