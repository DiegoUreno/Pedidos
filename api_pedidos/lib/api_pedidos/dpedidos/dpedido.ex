defmodule ApiPedidos.Dpedidos.Dpedido do
  use Ecto.Schema
  import Ecto.Changeset

  schema "DetallesPedidos" do
    field :monto, :float

    belongs_to :pedido, ApiPedidos.Pedidos.Pedido, foreign_key: :idPedido
    belongs_to :asignacion, ApiPedidos.Asignaciones.Asignacion, foreign_key: :idAsignacion
    timestamps()
  end

  @doc false
  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [:monto, :idPedido, :idAsignacion])
    |> validate_required([])
  end
end
