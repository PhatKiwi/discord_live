defmodule DiscordLive.ServersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DiscordLive.Servers` context.
  """

  @doc """
  Generate a server.
  """
  def server_fixture(attrs \\ %{}) do
    {:ok, server} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> DiscordLive.Servers.create_server()

    server
  end
end
