defmodule DiscordLive.Servers.Server do
  use Ecto.Schema
  import Ecto.Changeset

  schema "servers" do
    field :name, :string
    field :description, :string

    belongs_to :user, DiscordLive.Accounts.User, foreign_key: :owner_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(server, attrs) do
    server
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
