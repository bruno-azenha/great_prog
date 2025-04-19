defmodule GreatProgWeb.ValuesExerciseLive.IntroComponent do
  use GreatProgWeb, :live_component

  @impl true
  def render(assigns) do
    ~H"""
    <div class="p-8 mx-auto max-w-3xl bg-white rounded-lg shadow-md">
      <h2 class="mb-4 text-2xl font-semibold text-emerald-800">Welcome to the Core Values Exercise</h2>

      <div class="mb-8 max-w-none prose prose-emerald">
        <p class="text-lg">
          Our values act as an internal compass that guides our decisions, behaviors, and perspectives.
          Yet many of us haven't taken the time to clearly identify what matters most to us.
        </p>

        <p class="mt-4">
          This interactive exercise will help you discover and prioritize your core personal values through a
          simple, thoughtful process that involves:
        </p>

        <ol class="mt-4 space-y-2">
          <li><span class="font-medium text-emerald-700">Selecting values</span> that resonate with you from a comprehensive list</li>
          <li><span class="font-medium text-emerald-700">Comparing values</span> to determine their relative importance to you</li>
          <li><span class="font-medium text-emerald-700">Reflecting</span> on your top values and what they mean for your life</li>
        </ol>

        <p class="mt-4">
          The exercise typically takes 10-15 minutes to complete. We recommend completing it in one session
          for the best experience.
        </p>

        <p class="mt-4 italic text-zinc-600">
          Remember, there are no wrong answers. The goal is to gain clarity about what truly matters to you right now.
        </p>
      </div>

      <div class="flex justify-center mt-8">
        <button
          phx-click="next_step"
          class="inline-flex items-center px-6 py-3 text-lg font-medium text-white bg-emerald-600 rounded-md shadow-sm transition-colors duration-200 hover:bg-emerald-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-emerald-500"
        >
          Begin Exercise
          <svg xmlns="http://www.w3.org/2000/svg" class="ml-2 w-5 h-5" viewBox="0 0 20 20" fill="currentColor">
            <path fill-rule="evenodd" d="M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z" clip-rule="evenodd" />
          </svg>
        </button>
      </div>
    </div>
    """
  end
end
