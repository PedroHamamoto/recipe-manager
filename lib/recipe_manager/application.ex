defmodule RecipeManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RecipeManagerWeb.Telemetry,
      RecipeManager.Repo,
      {DNSCluster, query: Application.get_env(:recipe_manager, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: RecipeManager.PubSub},
      # Start a worker by calling: RecipeManager.Worker.start_link(arg)
      # {RecipeManager.Worker, arg},
      # Start to serve requests, typically the last entry
      RecipeManagerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: RecipeManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RecipeManagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
