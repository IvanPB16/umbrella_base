defmodule IntervalApi.Productos.Crud do
  alias Domain.Productos

  def listar_productos do
    Productos.lista_de_productos()
  end
end
