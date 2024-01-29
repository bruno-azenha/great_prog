defmodule GreatProgWeb.Components do
  use Phoenix.Component

  attr :name, :string, required: true
  attr :text, :string, required: true
  attr :avatar_url, :string, required: true

  def testimonial(assigns) do
    ~H"""
    <div class="relative border rounded-md border-zinc-400 p-7">
      <div class="text-sm text-zinc-400">
        <%= @text %>
      </div>
      <div class="flex items-center mt-6">
        <div class="avatar">
          <div class="w-12 h-12 rounded-full">
            <img src={@avatar_url} />
          </div>
        </div>
        <div class="ml-5 text-lg font-bold text-white">
          <%= @name %>
        </div>
      </div>
    </div>
    """
  end
end
