defmodule Public.ProductoLive.Index do
  use Public, :live_view
  alias IntervalApi.Productos.Crud

  @impl true
  def mount(_params, _session, socket) do
    lista = lista_productos()
    {:ok, assign(socket, :lista, lista)}
  end

  defp lista_productos do
    Crud.listar_productos()
  end

end
