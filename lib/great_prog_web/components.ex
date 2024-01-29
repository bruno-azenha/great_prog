defmodule GreatProgWeb.Components do
  use GreatProgWeb, :component

  alias GreatProgWeb.Endpoint

  attr :name, :string, required: true
  attr :text, :string, required: true
  attr :avatar_filename, :string, required: true

  def testimonial(assigns) do
    ~H"""
    <div class="relative border rounded-md border-zinc-400 p-7">
      <div class="text-sm text-zinc-400">
        <%= @text %>
      </div>
      <div class="flex items-center mt-6">
        <div class="avatar">
          <div class="w-12 h-12 rounded-full">
            <img src={Routes.static_path(Endpoint, "/images/#{@avatar_filename}")} />
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
