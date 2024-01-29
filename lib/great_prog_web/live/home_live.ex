defmodule GreatProgWeb.HomeLive do
  use GreatProgWeb, :live_view

  alias GreatProg.Testimonials

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(testimonials: Testimonials.get_all())

    {:ok, socket}
  end

  @impl true
  def handle_event(_event, _attrs, socket) do
    {:noreply, socket}
  end
end
