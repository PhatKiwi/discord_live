defmodule DiscordLiveWeb.ServerLive.Show do
  use DiscordLiveWeb, :live_view

  alias DiscordLive.Servers

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    server = Servers.get_server!(id)
    current_user = socket.assigns.current_user
    is_owner = current_user && current_user.id == server.owner_id

    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:server, server)
     |> assign(:is_owner, is_owner)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    server = Servers.get_server!(id)
    {:ok, _} = Servers.delete_server(server)

    {:noreply,
     socket
     |> put_flash(:info, "Server deleted successfully")
     |> push_navigate(to: ~p"/servers")}
  end

  defp page_title(:show), do: "Show Server"
  defp page_title(:edit), do: "Edit Server"
end
