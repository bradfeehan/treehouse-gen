defmodule TreehouseGen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TreehouseGenWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:treehouse_gen, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TreehouseGen.PubSub},
      # Start a worker by calling: TreehouseGen.Worker.start_link(arg)
      # {TreehouseGen.Worker, arg},
      # Start to serve requests, typically the last entry
      TreehouseGenWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TreehouseGen.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TreehouseGenWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
