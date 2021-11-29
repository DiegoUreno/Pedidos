defmodule ApiPedidos.Pedidos.Pedido do
  use Ecto.Schema
  import Ecto.Changeset

  schema "Pedidos" do
    field :fecha, :naive_datetime, null: false
    field :monto, :float, null: false

    belongs_to :proveedor, ApiPedidos.Proveedores.Proveedor, foreign_key: :idProveedor

    timestamps()
  end

  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [:fecha, :monto])
    |> validate_required([])
  end
end
