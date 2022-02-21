defmodule GreatProgWeb.HomeLive do
  use GreatProgWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_event(_event, _attrs, socket) do
    {:noreply, socket}
  end
end
