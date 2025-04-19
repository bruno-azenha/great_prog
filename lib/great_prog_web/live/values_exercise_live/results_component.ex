defmodule GreatProgWeb.ValuesExerciseLive.ResultsComponent do
  use GreatProgWeb, :live_component

  @impl true
  def update(assigns, socket) do
    top_values = Enum.take(assigns.ranked_values, 5)

    socket =
      socket
      |> assign(:ranked_values, assigns.ranked_values)
      |> assign(:values_data, assigns.values_data)
      |> assign(:top_values, top_values)

    {:ok, socket}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="max-w-5xl mx-auto">
      <div class="mb-10 text-center">
        <h2 class="text-2xl font-semibold text-emerald-800 mb-4">Your Core Values</h2>
        <p class="text-lg text-zinc-600 max-w-3xl mx-auto">
          Congratulations on clarifying your core values! These values represent what's most important to you right now.
          They form the foundation of your personal compass, helping you navigate decisions and set meaningful goals.
        </p>
      </div>

      <!-- Top 5 Values -->
      <div class="mb-12">
        <h3 class="text-xl font-semibold text-center text-emerald-700 mb-6">Your Top 5 Values</h3>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <%= for {value, index} <- Enum.with_index(@top_values) do %>
            <div class="bg-white rounded-xl shadow-md overflow-hidden border-t-4 border-emerald-600">
              <div class="px-6 py-4">
                <div class="flex items-start">
                  <div class="flex-shrink-0 flex items-center justify-center w-10 h-10 bg-emerald-600 text-white rounded-full mr-4">
                    <span class="text-lg font-bold"><%= index + 1 %></span>
                  </div>
                  <div>
                    <h4 class="text-xl font-semibold text-emerald-800"><%= value.name %></h4>
                    <p class="text-sm text-zinc-600 mt-1"><%= value.definition %></p>
                  </div>
                </div>
                <%= if Map.has_key?(@values_data.reflections, value.name) do %>
                  <div class="mt-4 bg-emerald-50 p-4 rounded-lg">
                    <h5 class="text-sm font-medium text-emerald-700 mb-2">Reflection</h5>
                    <p class="text-zinc-700 italic">
                      "<%= @values_data.reflections[value.name] %>"
                    </p>
                  </div>
                <% end %>
              </div>
            </div>
          <% end %>
        </div>
      </div>

      <!-- Coaching CTA -->
      <div class="mt-16 max-w-3xl mx-auto bg-gradient-to-br from-emerald-50 to-teal-50 rounded-2xl p-8 shadow-sm border border-emerald-100">
        <h3 class="text-2xl font-bold text-emerald-800 mb-4 text-center">
          Take Your Values Further
        </h3>
        <p class="text-zinc-700 mb-6">
          Understanding your core values is a powerful first step. The next challenge is integrating them into your daily decisions
          and long-term goals. Would you like support in aligning your life more fully with what matters most to you?
        </p>
        <div class="flex justify-center">
          <a
            href="https://calendly.com/bruno-azenha/coaching-call"
            target="_blank"
            class="inline-flex items-center px-6 py-3 text-lg font-medium text-white bg-emerald-600 rounded-md shadow-sm hover:bg-emerald-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-emerald-500 transition-colors duration-200"
          >
            Book a Coaching Session
          </a>
        </div>
      </div>

      <!-- Start Over Button -->
      <div class="mt-10 text-center">
        <button
          onclick="window.location.reload()"
          class="inline-flex items-center px-5 py-2 text-base font-medium text-emerald-700 bg-white border border-emerald-300 rounded-md hover:bg-emerald-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-emerald-500 transition-colors duration-200"
        >
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-2" viewBox="0 0 20 20" fill="currentColor">
            <path fill-rule="evenodd" d="M4 2a1 1 0 011 1v2.101a7.002 7.002 0 0111.601 2.566 1 1 0 11-1.885.666A5.002 5.002 0 005.999 7H9a1 1 0 010 2H4a1 1 0 01-1-1V3a1 1 0 011-1zm.008 9.057a1 1 0 011.276.61A5.002 5.002 0 0014.001 13H11a1 1 0 110-2h5a1 1 0 011 1v5a1 1 0 11-2 0v-2.101a7.002 7.002 0 01-11.601-2.566 1 1 0 01.61-1.276z" clip-rule="evenodd" />
          </svg>
          Start Over
        </button>
      </div>
    </div>
    """
  end
end
