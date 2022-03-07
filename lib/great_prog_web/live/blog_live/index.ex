defmodule GreatProgWeb.BlogLive.Index do
  use GreatProgWeb, :live_view

  alias GreatProg.Blog

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :posts, Blog.all_posts())}
  end

  @impl true
  def handle_event(_event, _attrs, socket) do
    {:noreply, socket}
  end

  def blog_post_card(assigns = %{post: post}) do
    ~H"""
    <div class="shadow-xl card bg-base-100">
      <figure><img src="https://api.lorem.space/image/shoes?w=400&h=225" alt="Shoes"></figure>
      <div class="card-body">
        <h2 class="card-title">
          <%= @post.title %>
          <%= if new?(@post) do %>
            <div class="badge badge-secondary">NEW</div>
          <% end %>
        </h2>
        <div class="">
        </div>
        <p>
          <%= @post.description %>
        </p>
        <div class="justify-end card-actions">
          <%= for tag <- @post.tags do %>
            <div class="badge badge-outline"><%= tag %></div>
          <% end %>
        </div>
      </div>
    </div>
    """
  end

  defp new?(%{date: post_date}) do
    today =
      DateTime.utc_now()
      |> DateTime.to_date()

    Date.diff(today, post_date) |> IO.inspect() <= 7
  end
end
