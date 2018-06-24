defmodule OAuth2.Application do
  @moduledoc false

  use Application

  def start(_, _) do
    import Supervisor.Spec, warn: false

    :ets.new(OAuth2.Serializer, [:named_table, :public, read_concurrency: true])

    Supervisor.start_link([], strategy: :one_for_one)
  end
end