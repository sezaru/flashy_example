defmodule FlashyExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FlashyExampleWeb.Telemetry,
      {DNSCluster, query: Application.get_env(:flashy_example, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FlashyExample.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FlashyExample.Finch},
      # Start a worker by calling: FlashyExample.Worker.start_link(arg)
      # {FlashyExample.Worker, arg},
      # Start to serve requests, typically the last entry
      FlashyExampleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FlashyExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FlashyExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
