defmodule GreatProgWeb.PostCardComponent do
  use GreatProgWeb, :live_component

  @days_in_week 7

  defp new?(%{date: post_date}) do
    today = DateTime.to_date(DateTime.utc_now())

    Date.diff(today, post_date) <= @days_in_week
  end
end
