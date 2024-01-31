defmodule GreatProgWeb.HomeLive do
  use GreatProgWeb, :live_view

  alias GreatProg.Testimonials
  alias GreatProg.Products

  @impl true
  def mount(_params, _session, socket) do
    socket =
      socket
      |> assign(testimonials: Testimonials.get_all())
      |> assign(products: Products.get_all())

    {:ok, socket}
  end

  @impl true
  def handle_event(_event, _attrs, socket) do
    {:noreply, socket}
  end
end
