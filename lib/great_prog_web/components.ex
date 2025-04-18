defmodule GreatProgWeb.Components do
  use GreatProgWeb, :component

  alias GreatProgWeb.Endpoint

  def navbar(assigns) do
    ~H"""
    <nav id="main-nav" class="fixed top-0 z-50 w-full shadow-sm backdrop-blur-sm transition-all duration-300 bg-white/95">
      <%!-- Mobile Navbar --%>
      <div class="flex justify-between items-center px-4 py-3 lg:hidden">
        <a href="#" class="text-3xl font-bold text-emerald-800 transition-colors duration-300">
          Bruno Azenha
        </a>

        <button id="mobile-menu-button" class="text-emerald-800 focus:outline-none">
          <svg xmlns="http://www.w3.org/2000/svg" class="w-8 h-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
          </svg>
        </button>
      </div>

      <%!-- Mobile Menu (Hidden by default) --%>
      <div id="mobile-menu" class="hidden px-4 py-3 pb-6 backdrop-blur-sm bg-white/95 lg:hidden">
        <div class="flex flex-col space-y-4">
          <a
            :for={item <- navbar_items()}
            href={item.link}
            class="py-2 text-lg font-medium text-emerald-800 border-b border-gray-200 hover:text-emerald-600 nav-link"
          >
            <%= item.text %>
          </a>
        </div>
      </div>

      <%!-- Desktop Navbar --%>
      <div class="container hidden px-6 py-4 mx-auto lg:flex lg:items-center lg:justify-between">
        <a href="#" class="text-3xl font-bold text-emerald-800 transition-colors duration-300">
          Bruno Azenha
        </a>

        <div class="flex items-center space-x-8">
          <a
            :for={item <- navbar_items()}
            class="relative text-lg font-medium text-emerald-800 transition-all duration-300 hover:text-emerald-600 nav-link after:absolute after:bottom-0 after:left-0 after:h-0.5 after:w-0 after:bg-emerald-600 after:transition-all hover:after:w-full"
            href={item.link}
          >
            <%= item.text %>
          </a>
        </div>
      </div>
    </nav>

    <%!-- Add script for navbar functionality --%>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        // Mobile menu toggle
        const mobileMenuButton = document.getElementById('mobile-menu-button');
        const mobileMenu = document.getElementById('mobile-menu');

        if (mobileMenuButton && mobileMenu) {
          mobileMenuButton.addEventListener('click', function() {
            mobileMenu.classList.toggle('hidden');
          });
        }

        // Navbar scroll behavior
        const navbar = document.getElementById('main-nav');
        let lastScrollTop = 0;

        function handleScroll() {
          const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

          // Add shadow and background when scrolling down
          if (scrollTop > 10) {
            navbar.classList.add('shadow-md');
            navbar.classList.add('bg-white');
            navbar.classList.remove('bg-white/95');
          } else {
            navbar.classList.remove('shadow-md');
            navbar.classList.add('bg-white/95');
            navbar.classList.remove('bg-white');
          }

          lastScrollTop = scrollTop;
        }

        window.addEventListener('scroll', handleScroll);

        // Highlight active section in navbar
        const navLinks = document.querySelectorAll('.nav-link');
        const sections = Array.from(navLinks).map(link => {
          const href = link.getAttribute('href');
          if (href.startsWith('#')) {
            return document.querySelector(href);
          }
          return null;
        }).filter(Boolean);

        function highlightActiveSection() {
          const scrollPosition = window.scrollY + 100;  // Offset for navbar height

          sections.forEach((section, index) => {
            if (!section) return;

            const sectionTop = section.offsetTop;
            const sectionHeight = section.offsetHeight;
            const sectionBottom = sectionTop + sectionHeight;

            const correspondingLink = navLinks[index];

            if (scrollPosition >= sectionTop && scrollPosition < sectionBottom) {
              correspondingLink.classList.add('text-emerald-600');
              correspondingLink.classList.add('font-semibold');
            } else {
              correspondingLink.classList.remove('text-emerald-600');
              correspondingLink.classList.remove('font-semibold');
            }
          });
        }

        window.addEventListener('scroll', highlightActiveSection);
        window.addEventListener('load', highlightActiveSection);
      });
    </script>
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
    <div class="flex relative flex-col p-7 h-full rounded-md border shadow-lg border-zinc-600 bg-zinc-800">
      <div class="absolute top-4 left-4 text-emerald-400 opacity-30">
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 24 24" fill="currentColor">
          <path d="M6.5 10c-.223 0-.437.034-.65.065.069-.232.14-.468.254-.68.114-.308.292-.575.469-.844.148-.291.409-.488.601-.737.201-.242.475-.403.692-.604.213-.21.492-.315.714-.463.232-.133.434-.28.65-.35.208-.086.39-.16.539-.222.302-.125.474-.197.474-.197L9.758 4.03c0 0-.218.052-.597.144C8.97 4.222 8.737 4.278 8.472 4.345c-.271.05-.56.187-.882.312C7.272 4.799 6.904 4.895 6.562 5.123c-.344.218-.741.4-1.091.692C5.132 6.116 4.723 6.377 4.421 6.76c-.33.358-.656.734-.909 1.162C3.219 8.33 3.02 8.778 2.81 9.221c-.19.443-.343.896-.468 1.336-.237.882-.343 1.72-.384 2.437-.034.718-.014 1.315.028 1.747.015.204.043.402.063.539.017.109.025.168.025.168l.026-.006C2.535 17.474 4.338 19 6.5 19c2.485 0 4.5-2.015 4.5-4.5S8.985 10 6.5 10zM17.5 10c-.223 0-.437.034-.65.065.069-.232.14-.468.254-.68.114-.308.292-.575.469-.844.148-.291.409-.488.601-.737.201-.242.475-.403.692-.604.213-.21.492-.315.714-.463.232-.133.434-.28.65-.35.208-.086.39-.16.539-.222.302-.125.474-.197.474-.197L20.758 4.03c0 0-.218.052-.597.144-.191.048-.424.104-.689.171-.271.05-.56.187-.882.312-.317.143-.686.238-1.028.467-.344.218-.741.4-1.091.692-.339.301-.748.562-1.05.944-.33.358-.656.734-.909 1.162C14.219 8.33 14.02 8.778 13.81 9.221c-.19.443-.343.896-.468 1.336-.237.882-.343 1.72-.384 2.437-.034.718-.014 1.315.028 1.747.015.204.043.402.063.539.017.109.025.168.025.168l.026-.006C13.535 17.474 15.338 19 17.5 19c2.485 0 4.5-2.015 4.5-4.5S19.985 10 17.5 10z" />
        </svg>
      </div>

      <div class="flex flex-col flex-grow justify-center text-sm leading-relaxed text-white">
        <div class="pb-4 mb-4 border-b border-zinc-700"><%= @text %></div>
      </div>

      <div class="flex items-center mt-2">
        <div class="overflow-hidden w-10 h-10 rounded-full bg-zinc-600">
          <img
            src={Routes.static_path(Endpoint, "/images/avatars/#{@avatar_filename}")}
            alt={@name}
            class="object-cover w-full h-full"
            loading="lazy"
          />
        </div>
        <div class="ml-3">
          <div class="font-medium text-emerald-400"><%= @name %></div>
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
    <div class="flex flex-col items-center justify-center transition-transform duration-300 hover:translate-y-[-4px] sm:hover:translate-y-[-8px]">
      <div class="flex flex-col justify-center items-center w-full sm:hidden">
        <div class="relative text-2xl font-extrabold text-zinc-900">
          <%= @name %>
          <div class="absolute h-1 w-16 bg-emerald-500 bottom-[-8px] left-1/2 transform translate-x-[-50%]"></div>
        </div>
        <img
          class="w-full rounded-[16px] mt-8 shadow-lg object-cover max-h-48 object-top"
          src={Routes.static_path(Endpoint, "/images/#{@product_image_filename}")}
          alt={@name}
          loading="lazy"
        />

        <div class="px-2 mt-6 space-y-3 text-zinc-800">
          <p :for={paragraph <- @description_paragraphs} class="mt-1 leading-relaxed"><%= paragraph %></p>
        </div>
      </div>

      <div class="hidden sm:flex sm:gap-6 md:gap-8">
        <div class="pr-4 w-3/4 grow">
          <div class="inline-block relative text-xl font-extrabold md:text-2xl xl:text-3xl text-zinc-900">
            <%= @name %>
            <div class="absolute h-1 w-16 bg-emerald-500 bottom-[-8px] left-0"></div>
          </div>
          <div class="mt-10 text-lg md:text-xl text-zinc-800">
            <p :for={paragraph <- @description_paragraphs} class="mt-4 leading-relaxed"><%= paragraph %></p>
          </div>
        </div>
        <div class="flex items-start justify-center w-1/4 pt-6 min-w-[120px]">
          <img
            class="object-cover object-top mx-auto w-full rounded-lg shadow-xl"
            src={Routes.static_path(Endpoint, "/images/#{@product_image_filename}")}
            alt={@name}
            loading="lazy"
          />
        </div>
      </div>

      <div class="mt-8 text-center">
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
    <div class="flex relative flex-col py-8 image_quote">
      <img
        class="object-cover self-start w-3/4 rounded-lg shadow-lg"
        src={Routes.static_path(Endpoint, "/images/#{@image_filename}")}
        alt="Inspiring quote"
        loading="lazy"
      />
      <div class="absolute top-0 right-0 bg-zinc-950/90 z-[-1] w-1/2 h-full" />

      <div class="flex absolute top-0 right-4 justify-center items-center w-1/2 h-full">
        <div class="p-3 text-xl text-right text-white border-r-4 border-emerald-400 drop-shadow-[0_1px_2px_rgba(0,0,0,0.8)] sm:text-2xl xl:text-3xl">
          "<%= @quote %>" <br />
          <span class="font-medium text-emerald-300"><%= @author %></span>
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
      class="inline-flex overflow-hidden relative justify-center items-center px-6 py-3 text-base font-semibold text-white uppercase bg-emerald-600 rounded-full shadow-md transition-all duration-300 transform hover:bg-emerald-700 hover:shadow-lg hover:-translate-y-1 group"
    >
      <span class="relative z-10"><%= @text %></span>
      <span class="absolute inset-0 bg-emerald-500 transition-transform duration-300 ease-out origin-left scale-x-0 group-hover:scale-x-100"></span>
    </.link>
    """
  end
end
