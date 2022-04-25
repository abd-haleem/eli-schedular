defmodule Quantum.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Quantum.Repo,
      # Start the Telemetry supervisor
      QuantumWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Quantum.PubSub},
      # Start the Endpoint (http/https)
      QuantumWeb.Endpoint
      # Start a worker by calling: Quantum.Worker.start_link(arg)
      # {Quantum.Worker, arg}
      Quantum.Quantum
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Quantum.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    QuantumWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
