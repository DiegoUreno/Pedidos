defmodule ApiPedidos.Asignaciones.Asignacion do
  use Ecto.Schema
  import Ecto.Changeset

  schema "Asignaciones" do

    timestamps()
  end

  @doc false
  def changeset(pedido, attrs) do
    pedido
    |> cast(attrs, [])
  end
end
