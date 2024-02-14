defmodule GreatProgWeb.Components do
  use GreatProgWeb, :component

  alias GreatProgWeb.Endpoint

  def navbar(assigns) do
    ~H"""
    <nav class="bg-white">
      <%!-- Mobile Navbar --%>
      <div class="flex items-center justify-between px-4 py-2 lg:hidden">
        <div class="text-4xl font-bold text-gray-950">
          Bruno Azenha
        </div>

        <div class="dropdown dropdown-end">
          <Heroicons.bars_3 tabindex="0" role="button" class="w-10 h-10 text-gray-950" />

          <ul
            tabindex="0"
            class="dropdown-content shadow w-60  z-[1] menu p-2 bg-base-100 rounded-box"
          >
            <li :for={item <- navbar_items()}>
              <a href={item.link} class="text-3xl text-gray-950"><%= item.text %></a>
            </li>
          </ul>
        </div>
      </div>
      <%!-- Desktop Navbar --%>
      <div class="container items-center justify-center hidden gap-5 py-3 mx-auto text-gray-950 lg:flex">
        <div class="mr-10 text-4xl font-bold shrink-0 text-gray-950">
          Bruno Azenha
        </div>
        <a
          :for={item <- navbar_items()}
          class="text-2xl cursor-pointer text-gray-950 shrink-0"
          href={item.link}
        >
          <%= item.text %>
        </a>
      </div>
    </nav>
    """
  end

  defp navbar_items() do
    [
      %{text: "About", link: "#about"},
      %{text: "Work With Me", link: "#work-with-me"},
      %{text: "Testimonials", link: "#testimonials"}
    ]
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
  attr :description_paragraphs, :string, required: true
  attr :product_image_filename, :string, required: true
  attr :link, :string, required: true
  attr :link_text, :string, required: true

  def product(assigns) do
    ~H"""
    <div class="flex flex-col items-center justify-center">
      <div class="flex flex-col items-center justify-center sm:hidden">
        <div class="text-2xl font-extrabold">
          <%= @name %>
        </div>
        <img
          class="w-11/12 rounded-[64px] mt-8"
          src={Routes.static_path(Endpoint, "/images/#{@product_image_filename}")}
        />

        <div class="mt-8">
          <p :for={paragraph <- @description_paragraphs} class="mt-1"><%= paragraph %></p>
        </div>
      </div>

      <div class="hidden sm:flex">
        <div class="w-3/4 pr-4 grow">
          <div class="text-xl font-extrabold md:text-2xl xl:text-4xl">
            <%= @name %>
          </div>
          <div class="mt-8 text-lg md:text-xl xl:text-2xl">
            <p :for={paragraph <- @description_paragraphs} class="mt-2"><%= paragraph %></p>
          </div>
        </div>
        <div class="flex items-center justify-center w-1/4 h-full">
          <img
            class="object-cover mx-auto rounded-lg"
            src={Routes.static_path(Endpoint, "/images/#{@product_image_filename}")}
          />
        </div>
      </div>

      <div class="mt-4 text-center">
        <.button text={@link_text} link={@link} />
      </div>
    </div>
    """
  end

  attr :quote, :string, required: true
  attr :author, :string, required: true
  attr :image_filename, :string, required: true

  def image_quote(assigns) do
    ~H"""
    <div class="relative flex flex-col py-8">
      <img
        class="self-start object-cover w-3/4 rounded"
        src={Routes.static_path(Endpoint, "/images/#{@image_filename}")}
      />
      <div class="absolute top-0 right-0 bg-zinc-950 z-[-1] w-1/2 h-full" />

      <div class="absolute top-0 flex items-center justify-center w-1/2 h-full right-4">
        <div class="p-2 text-xl text-right text-white border-r-4 border-white sm:text-3xl xl:text-4xl">
          "<%= @quote %>" <br />
          <%= @author %>
        </div>
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
