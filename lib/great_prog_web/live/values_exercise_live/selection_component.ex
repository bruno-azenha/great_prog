defmodule GreatProgWeb.ValuesExerciseLive.SelectionComponent do
  use GreatProgWeb, :live_component

  @impl true
  def update(assigns, socket) do
    # Get the current active_category if it exists, otherwise default to first category
    active_category = socket.assigns[:active_category] || Enum.at(assigns.values_data.categories, 0).name

    {:ok,
      socket
      |> assign(:values_data, assigns.values_data)
      |> assign(:selected_values, assigns.selected_values)
      |> assign(:active_category, active_category)
    }
  end

  @impl true
  def handle_event("select_category", %{"category" => category}, socket) do
    {:noreply, assign(socket, :active_category, category)}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-6xl">
      <div class="mb-8 text-center">
        <h2 class="mb-4 text-2xl font-semibold text-emerald-800">Select Your Values</h2>
        <p class="mx-auto max-w-3xl text-lg text-zinc-600">
          Choose values that resonate with you the most. Don't overthink it - go with what feels right.
          You'll have a chance to prioritize them in the next step.
        </p>

        <div class="mt-4 text-center">
          <span class={"text-xl font-semibold #{if length(@selected_values) >= 10, do: "text-emerald-600", else: "text-zinc-600"}"}>
            <%= length(@selected_values) %> values selected
          </span>
          <%= if length(@selected_values) < 10 do %>
            <p class="mt-1 text-sm text-amber-600">Please select at least 10 values to continue</p>
          <% end %>
        </div>
      </div>

      <!-- Category Navigation -->
      <div class="overflow-x-auto mb-6 scrollbar-hide">
        <div class="flex pb-2 space-x-2 min-w-max">
          <%= for category <- @values_data.categories do %>
            <button
              phx-click="select_category"
              phx-value-category={category.name}
              phx-target={@myself}
              class={"px-3 py-2 text-sm font-medium rounded-full transition-colors whitespace-nowrap
                #{if @active_category == category.name, do: "bg-emerald-600 text-white", else: "bg-gray-200 text-zinc-700 hover:bg-gray-300"}"}
            >
              <%= category.name %>
              <!-- Show small badge with count if any selected from this category -->
              <%= if category_selected_count(@selected_values, category.name) > 0 do %>
                <span class={"ml-1 inline-flex items-center justify-center px-2 py-1 text-xs font-bold leading-none rounded-full
                  #{if @active_category == category.name, do: "bg-white text-emerald-600", else: "bg-emerald-600 text-white"}"}>
                  <%= category_selected_count(@selected_values, category.name) %>
                </span>
              <% end %>
            </button>
          <% end %>
        </div>
      </div>

      <!-- Values Grid -->
      <div class="grid grid-cols-2 gap-3 mb-10 md:grid-cols-3 lg:grid-cols-4">
        <%= for category <- @values_data.categories, category.name == @active_category do %>
          <%= for value <- category.values do %>
            <div
              phx-click="select_value"
              phx-value-id={value.id}
              class={"group relative flex flex-col justify-between p-3 rounded-lg border-2 transition-colors cursor-pointer
                #{if value_selected?(@selected_values, value.id), do: "border-emerald-600 bg-emerald-50", else: "border-gray-200 hover:border-emerald-300 bg-white"}"}
            >
              <div>
                <h3 class={"font-medium mb-1 text-base lg:text-lg transition-colors
                  #{if value_selected?(@selected_values, value.id), do: "text-emerald-700", else: "text-zinc-800 group-hover:text-emerald-600"}"}>
                  <%= value.name %>
                </h3>
                <p class="mb-2 text-xs sm:text-sm text-zinc-600">
                  <%= value.definition %>
                </p>
              </div>

              <div class="flex justify-end mt-2">
                <%= if value_selected?(@selected_values, value.id) do %>
                  <div class="flex justify-center items-center w-6 h-6 text-white bg-emerald-600 rounded-full">
                    <svg xmlns="http://www.w3.org/2000/svg" class="w-4 h-4" viewBox="0 0 20 20" fill="currentColor">
                      <path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd" />
                    </svg>
                  </div>
                <% else %>
                  <div class="w-6 h-6 rounded-full border-2 border-gray-300 border-dashed group-hover:border-emerald-400"></div>
                <% end %>
              </div>
            </div>
          <% end %>
        <% end %>
      </div>

      <div class="flex justify-between mt-6">
        <button phx-click="prev_step" class="px-4 py-2 text-sm btn btn-outline sm:text-base sm:py-2 sm:px-5">Back</button>

        <button phx-click="complete_selection" class="px-4 py-2 text-sm btn btn-primary sm:text-base sm:py-2 sm:px-5"
                disabled={length(@selected_values) < 10}>
          Continue
        </button>
      </div>
    </div>
    """
  end

  defp value_selected?(selected_values, value_id) do
    Enum.any?(selected_values, fn v -> v.id == value_id end)
  end

  defp category_selected_count(selected_values, category_name) do
    selected_values
    |> Enum.filter(fn value ->
      String.starts_with?(value.id, String.downcase(category_name))
    end)
    |> length()
  end
end
