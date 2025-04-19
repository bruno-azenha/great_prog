defmodule GreatProgWeb.ValuesExerciseLive do
  use GreatProgWeb, :live_view

  alias GreatProgWeb.ValuesExerciseLive.{
    IntroComponent,
    SelectionComponent,
    ComparisonComponent,
    ResultsComponent
  }

  @steps [:intro, :selection, :comparison, :results]

  @impl true
  def mount(params, _session, socket) do
    values_data = load_values_data()
    # Check for debug mode from query params
    debug_mode = params["debug"] == "true"

    socket =
      socket
      |> assign(:page_title, "Core Values Exercise")
      |> assign(:current_step, :intro)
      |> assign(:steps, @steps)
      |> assign(:values_data, values_data)
      |> assign(:selected_values, [])
      |> assign(:ranked_values, [])
      |> assign(:debug_mode, debug_mode)

    {:ok, socket}
  end

  @impl true
  def handle_event("next_step", _params, socket) do
    current_step = socket.assigns.current_step
    current_index = Enum.find_index(@steps, fn step -> step == current_step end)
    next_step = Enum.at(@steps, current_index + 1)

    {:noreply, assign(socket, :current_step, next_step)}
  end

  @impl true
  def handle_event("prev_step", _params, socket) do
    current_step = socket.assigns.current_step
    current_index = Enum.find_index(@steps, fn step -> step == current_step end)
    prev_step = Enum.at(@steps, current_index - 1)

    {:noreply, assign(socket, :current_step, prev_step)}
  end

  @impl true
  def handle_event("select_value", %{"id" => id}, socket) do
    value = find_value_by_id(socket.assigns.values_data, id)
    selected_values = socket.assigns.selected_values

    new_selected_values =
      if Enum.member?(selected_values, value) do
        Enum.reject(selected_values, fn v -> v.id == value.id end)
      else
        [value | selected_values]
      end

    {:noreply, assign(socket, :selected_values, new_selected_values)}
  end

  @impl true
  def handle_event("complete_selection", _params, socket) do
    selected_values = socket.assigns.selected_values

    if length(selected_values) >= 10 do
      # Start with the first value as the initial sorted value
      # and the second value to compare
      first_value = List.first(selected_values)
      second_value = Enum.at(selected_values, 1)
      remaining = Enum.slice(selected_values, 2..-1)

      # We need to compare the second value with the first to determine initial ranking
      {:noreply,
        socket
        |> assign(:current_step, :comparison)
        |> assign(:ranked_values, [first_value])
        |> assign(:current_value, second_value)
        |> assign(:remaining_values, remaining)
        |> assign(:comparison_index, 0)  # Current position in ranked_values being compared
        |> assign(:comparisons_completed, 0)
        |> assign(:low, 0)  # Binary search lower bound
        |> assign(:high, 0)  # Binary search upper bound (will be 0 for the first comparison)
        |> assign(:top_n, 5)  # We only care about the top 5 values
      }
    else
      {:noreply, socket}
    end
  end

  @impl true
  def handle_event("choose_value", %{"choice" => choice}, socket) do
    current_value = socket.assigns.current_value
    ranked_values = socket.assigns.ranked_values
    remaining_values = socket.assigns.remaining_values
    comparison_index = socket.assigns.comparison_index
    low = socket.assigns.low
    high = socket.assigns.high
    top_n = socket.assigns.top_n
    comparisons_completed = socket.assigns.comparisons_completed + 1

    # Determine next step based on binary search with early termination
    {new_ranked_values, next_value, next_remaining, next_index, next_low, next_high, is_done} =
      case choice do
        "current" ->
          # Current value wins this comparison - it is more important than the ranked value at comparison_index
          if high <= low do
            # We've narrowed down to the exact position - insert and move to next value
            {
              List.insert_at(ranked_values, comparison_index, current_value),
              nil,
              remaining_values,
              0,  # For next value, start at the beginning
              0,  # Reset low for next value
              0,  # Reset high for next value (will be updated for the next value)
              true  # We're done comparing this value, move to next
            }
          else
            # We need to continue binary search in the upper half
            new_high = comparison_index - 1
            new_mid = div(low + new_high, 2)

            # Check if we've narrowed down to a final position
            if new_high < low do
              # Insert at current position and move to next value
              {
                List.insert_at(ranked_values, comparison_index, current_value),
                nil,
                remaining_values,
                0,  # Reset for next value
                0,  # Reset for next value
                0,  # Reset for next value
                true  # Done with this value
              }
            else
              # Continue binary search
              {
                ranked_values,
                current_value,
                remaining_values,
                new_mid,  # Set mid as next comparison point
                low,
                new_high,
                false  # Not done yet
              }
            end
          end

        "ranked" ->
          # Current ranked value wins - it is more important than the current value
          if high <= low do
            # We've narrowed down to the exact position - must be at the end or next position
            if comparison_index == length(ranked_values) - 1 do
              # If at the end, append
              {
                ranked_values ++ [current_value],
                nil,
                remaining_values,
                0,  # Reset for next value
                0,  # Reset for next value
                0,  # Reset for next value
                true  # Done with this value
              }
            else
              # Insert at the next position
              {
                List.insert_at(ranked_values, comparison_index + 1, current_value),
                nil,
                remaining_values,
                0,  # Reset for next value
                0,  # Reset for next value
                0,  # Reset for next value
                true  # Done with this value
              }
            end
          else
            # Continue binary search in the lower half
            new_low = comparison_index + 1

            # Early termination check - if we've determined this value can't be in top N
            # and we already have at least N items ranked, we can skip further comparisons
            if length(ranked_values) >= top_n && new_low >= top_n do
              # This value is not in the top N, so we can discard it
              # We don't actually insert it, just mark as done and move to next value
              {
                ranked_values,  # Keep the ranked values as is
                nil,
                remaining_values,
                0,  # Reset for next value
                0,  # Reset for next value
                0,  # Reset for next value
                true  # Done with this value
              }
            else
              # Check if we've reached the end of the list
              if new_low >= length(ranked_values) do
                # Append at the end
                {
                  ranked_values ++ [current_value],
                  nil,
                  remaining_values,
                  0,  # Reset for next value
                  0,  # Reset for next value
                  0,  # Reset for next value
                  true  # Done with this value
                }
              else
                # Calculate new midpoint for binary search
                new_mid = div(new_low + high, 2)

                # Check if we've narrowed down to a final position
                if new_low > high do
                  # Insert at new_low position and move to next value
                  {
                    List.insert_at(ranked_values, new_low, current_value),
                    nil,
                    remaining_values,
                    0,  # Reset for next value
                    0,  # Reset for next value
                    0,  # Reset for next value
                    true  # Done with this value
                  }
                else
                  # Continue binary search
                  {
                    ranked_values,
                    current_value,
                    remaining_values,
                    new_mid,  # Updated comparison index
                    new_low,
                    high,
                    false  # Not done yet
                  }
                end
              end
            end
          end
      end

    socket =
      if is_done do
        if Enum.empty?(next_remaining) do
          # All values have been compared and ranked - move to results
          socket
          |> assign(:current_step, :results)
          |> assign(:ranked_values, new_ranked_values)
        else
          # Move to next value to insert with binary search
          next_val = List.first(next_remaining)
          rest_vals = Enum.slice(next_remaining, 1..-1)

          # For a new value, start binary search with focus on top N values
          # Start comparison around the middle of potential top N positions
          # If we already have more than top_n values ranked, we focus only on the top N region
          max_high = min(length(new_ranked_values) - 1, top_n - 1)
          # If we've already ranked top_n values, we start comparison at the middle top value
          new_mid = if length(new_ranked_values) < top_n do
                      div(max_high, 2)  # Start in middle of current list if smaller than top_n
                    else
                      div(top_n - 1, 2)  # Focus on the top_n values region
                    end

          socket
          |> assign(:ranked_values, new_ranked_values)
          |> assign(:current_value, next_val)
          |> assign(:remaining_values, rest_vals)
          |> assign(:comparison_index, new_mid)  # Focused on top N region
          |> assign(:low, 0)  # Reset low bound
          |> assign(:high, max_high)  # Focus high bound on top N region
          |> assign(:comparisons_completed, comparisons_completed)
        end
      else
        # Continue binary search with the same value
        socket
        |> assign(:ranked_values, ranked_values)
        |> assign(:current_value, next_value)
        |> assign(:remaining_values, next_remaining)
        |> assign(:comparison_index, next_index)
        |> assign(:low, next_low)
        |> assign(:high, next_high)
        |> assign(:comparisons_completed, comparisons_completed)
      end

    {:noreply, socket}
  end

  defp load_values_data do
    # Read and parse the values.json file
    values_path = Path.join(:code.priv_dir(:great_prog), "static/data/values.json")
    {:ok, json} = File.read(values_path)
    Jason.decode!(json, keys: :atoms)
  end

  defp find_value_by_id(values_data, id) do
    values_data.categories
    |> Enum.flat_map(fn category -> category.values end)
    |> Enum.find(fn value -> value.id == id end)
  end
end
