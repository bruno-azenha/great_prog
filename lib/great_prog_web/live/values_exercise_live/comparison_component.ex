defmodule GreatProgWeb.ValuesExerciseLive.ComparisonComponent do
  use GreatProgWeb, :live_component

  @impl true
  def render(assigns) do
    # Get the current ranked value being compared based on comparison_index
    ranked_value = Enum.at(assigns.ranked_values, assigns.comparison_index)

    assigns = assign(assigns, :ranked_value, ranked_value)

    ~H"""
    <div class="mx-auto max-w-4xl">
      <div class="mb-10 text-center">
        <h2 class="mb-4 text-2xl font-semibold text-emerald-800">Compare Your Values</h2>
        <p class="mx-auto max-w-3xl text-lg text-zinc-600">
          Now we'll help you prioritize your selected values by comparing them one pair at a time.
          For each pair, choose the value that feels more essential to you right now.
        </p>

        <div class="mt-4">
          <span class="text-base font-medium text-zinc-600">
            Comparisons completed: <%= @comparisons_completed %>
          </span>
        </div>
      </div>

      <div class="flex flex-col gap-6 justify-center items-center mb-10 md:flex-row md:items-stretch">
        <!-- Current Value Card -->
        <div
          phx-click="choose_value"
          phx-value-choice="current"
          class="flex flex-col flex-1 justify-between p-6 w-full max-w-sm bg-white rounded-xl border-2 border-emerald-400 shadow-md transition-shadow cursor-pointer hover:shadow-lg"
        >
          <div class="flex-grow">
            <h3 class="mb-2 text-xl font-semibold text-emerald-800"><%= @current_value.name %></h3>
            <p class="text-zinc-600"><%= @current_value.definition %></p>
          </div>
          <div class="pt-4 mt-6 text-center border-t border-gray-100">
            <span class="inline-block px-4 py-2 text-sm font-medium text-emerald-700 bg-emerald-50 rounded-full">
              Select This Value
            </span>
          </div>
        </div>

        <div class="flex justify-center items-center">
          <div class="flex justify-center items-center w-12 h-12 text-gray-500 bg-gray-200 rounded-full">
            <span class="text-lg font-semibold">OR</span>
          </div>
        </div>

        <!-- Ranked Value Card -->
        <div
          phx-click="choose_value"
          phx-value-choice="ranked"
          class="flex flex-col flex-1 justify-between p-6 w-full max-w-sm bg-white rounded-xl border-2 border-violet-400 shadow-md transition-shadow cursor-pointer hover:shadow-lg"
        >
          <div class="flex-grow">
            <h3 class="mb-2 text-xl font-semibold text-violet-800"><%= @ranked_value.name %></h3>
            <p class="text-zinc-600"><%= @ranked_value.definition %></p>
          </div>
          <div class="pt-4 mt-6 text-center border-t border-gray-100">
            <span class="inline-block px-4 py-2 text-sm font-medium text-violet-700 bg-violet-50 rounded-full">
              Select This Value
            </span>
          </div>
        </div>
      </div>

      <div class="mb-8 text-sm italic text-center text-zinc-500">
        Choose the value that feels more important to you right now, in this season of your life.
      </div>

      <!-- Debug information - only shown when debug_mode is true -->
      <%= if @debug_mode do %>
        <div class="mt-10 p-4 border border-gray-300 rounded-md bg-gray-50">
          <h3 class="text-lg font-semibold mb-2">Debug Information</h3>

          <div class="mb-4">
            <h4 class="font-medium">Current comparison:</h4>
            <p>Comparing with value at position: <%= @comparison_index %> of <%= length(@ranked_values) - 1 %></p>
            <p>Binary search bounds: low=<%= @low %>, high=<%= @high %></p>
            <p>Looking for top <%= @top_n %> values <%= if length(@ranked_values) >= @top_n && @low >= @top_n, do: "(Early termination possible)", else: "" %></p>
          </div>

          <div class="mb-4">
            <h4 class="font-medium">L2 (Ranked Values - <%= length(@ranked_values) %>):</h4>
            <div class="flex flex-wrap gap-2 mt-2">
              <%= for {value, index} <- Enum.with_index(@ranked_values) do %>
                <span class={"px-3 py-1 text-sm rounded-full #{if index == @comparison_index, do: "bg-violet-200 font-bold", else: "bg-gray-200"}"}>
                  <%= index + 1 %>. <%= value.name %>
                </span>
              <% end %>
            </div>
          </div>

          <div>
            <h4 class="font-medium">L1 (Remaining Values - <%= length(@remaining_values) + 1 %>):</h4>
            <div class="flex flex-wrap gap-2 mt-2">
              <span class="px-3 py-1 text-sm bg-emerald-200 font-bold rounded-full">
                Current: <%= @current_value.name %>
              </span>
              <%= for value <- @remaining_values do %>
                <span class="px-3 py-1 text-sm bg-gray-200 rounded-full">
                  <%= value.name %>
                </span>
              <% end %>
            </div>
          </div>
        </div>
      <% end %>
    </div>
    """
  end
end
