defmodule ApiPedidos.Repo do
  use Ecto.Repo,
    otp_app: :api_pedidos,
    adapter: Ecto.Adapters.MyXQL
end
