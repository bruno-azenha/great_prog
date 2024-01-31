defmodule GreatProgWeb.Components do
  use GreatProgWeb, :component

  alias GreatProgWeb.Endpoint

  def navbar(assigns) do
    ~H"""
    <nav class="bg-white">
      <%!-- Mobile Navbar --%>
      <div class="flex items-center justify-between px-4 sm:hidden">
        <div class="text-2xl font-bold text-gray-950">
          Bruno Azenha
        </div>

        <div class="dropdown dropdown-end">
          <Heroicons.bars_3 tabindex="0" role="button" class="w-6 h-6 text-gray-950" />

          <ul tabindex="0" class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box">
            <li><a>Item 1</a></li>
            <li><a>Item 2</a></li>
          </ul>
        </div>
      </div>
      <%!-- Desktop Navbar --%>
      <div class="container items-center justify-center hidden gap-20 py-5 mx-auto text-gray-950 sm:flex ">
        <div class="text-4xl font-bold">
          Bruno Azenha
        </div>

        <div class="">
          <%= gettext("My Story") %>
        </div>
        <div class="">
          <%= gettext("Work With Me") %>
        </div>
        <div class="">
          <%= gettext("Speaking") %>
        </div>
      </div>
    </nav>
    """
  end

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

  attr :name, :string, required: true
  attr :description, :string, required: true
  attr :product_image_filename, :string, required: true
  attr :link, :string, required: true

  def product(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center">
      <div class="text-2xl font-extrabold">
        <%= @name %>
      </div>
      <img
        class="w-11/12 rounded-[64px] mt-8"
        src={Routes.static_path(Endpoint, "/images/#{@product_image_filename}")}
      />

      <div class="mt-8">
        <%= @description %>
      </div>
      <div class="mt-4">
        <.button text="Free Discovery Call" link={@link} />
      </div>
    </div>
    """
  end

  attr :text, :string, required: true
  attr :link, :string, required: true

  def button(assigns) do
    ~H"""
    <.link
      href={@link}
      class="flex items-center justify-center px-6 py-4 text-2.5xl font-bold text-white uppercase bg-black rounded-full"
    >
      <%= @text %>
    </.link>
    """
  end
end
