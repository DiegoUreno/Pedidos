defmodule ApiPedidos.Pedidos do
  @moduledoc """
  The Pedidos context.
  """

  import Ecto.Query, warn: false
  alias ApiPedidos.Repo

    alias ApiPedidos.Pedidos.Pedido
    alias ApiPedidos.Asignaciones.Asignacion
    alias ApiPedidos.Dpedidos.Dpedido
    alias ApiPedidos.Productos.Producto
    alias ApiPedidos.Drequisiciones.Drequisicion
    alias ApiPedidos.Proveedores.Proveedor

  def get_pedido(id) do

  query = from p in Pedido,
  join: dp in Dpedido, on: p.id == dp.idPedido,
  join: a in Asignacion, on: a.id == dp.idAsignacion,
  join: dr in Drequisicion, on: dr.id == a.idDetalleRequisicion,
  join: p2 in Producto, on: p2.id == dr.idProducto,
  join: p3 in Proveedor, on: p3.id == p.idProveedor,
  where: p.id == ^id,
  select: %{
    id: p.id,
    fecha: p.fecha,
    monto: p.monto,
    monto_pedido: dp.monto,
    cantidad: dr.cantidad,
    producto: p2.nombre,
    presentacion: p2.presentacion,
    proveedor: p3.nombre,
  }
    Repo.all(query)


  end
end
