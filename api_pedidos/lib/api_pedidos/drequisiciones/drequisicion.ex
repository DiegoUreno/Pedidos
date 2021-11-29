defmodule ApiPedidos.Drequisiciones.Drequisicion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "DetallesRequisiciones" do
    field :cantidad, :float

    belongs_to :producto, ApiPedidos.Productos.Producto, foreign_key: :idProducto
    timestamps()
  end

  @doc false
  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [:cantidad, :idProducto])
    |> validate_required([])
  end
end
