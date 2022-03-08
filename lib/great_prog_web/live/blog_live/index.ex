defmodule GreatProgWeb.BlogLive.Index do
  use GreatProgWeb, :live_view

  alias GreatProg.Blog
  alias GreatProgWeb.PostCardComponent

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :posts, Blog.all_posts())}
  end

  @impl true
  def handle_event(_event, _attrs, socket) do
    {:noreply, socket}
  end
end
