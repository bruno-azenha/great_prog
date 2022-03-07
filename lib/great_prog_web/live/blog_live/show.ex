defmodule GreatProgWeb.BlogLive.Show do
  use GreatProgWeb, :live_view

  alias GreatProg.Blog

  @impl true
  def mount(%{"id" => post_id}, _session, socket) do
    {:ok, assign(socket, :post, Blog.get_post_by_id!(post_id))}
  end

  @impl true
  def handle_event(_event, _attrs, socket) do
    {:noreply, socket}
  end
end
