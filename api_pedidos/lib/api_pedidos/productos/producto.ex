defmodule ApiPedidos.Productos.Producto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "Productos" do
    field :nombre, :string
    field :presentacion, :string

    timestamps()
  end

  @doc false
  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [:nombre, :presentacion])
    |> validate_required([])
  end
end
