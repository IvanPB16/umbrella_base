defmodule Domain.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Domain.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Domain.PubSub}
      # Start a worker by calling: Domain.Worker.start_link(arg)
      # {Domain.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Domain.Supervisor)
  end
end
