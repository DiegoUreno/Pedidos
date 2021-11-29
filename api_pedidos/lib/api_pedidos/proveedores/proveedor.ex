defmodule ApiPedidos.Proveedores.Proveedor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "Proveedores" do
    field :nombre, :string
    timestamps()
  end

  @doc false
  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [:nombre])
    |> validate_required([])
  end
end
