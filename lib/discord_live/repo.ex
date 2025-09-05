defmodule DiscordLive.Repo do
  use Ecto.Repo,
    otp_app: :discord_live,
    adapter: Ecto.Adapters.Postgres
end
