defmodule GreatProgWeb.Router do
  use GreatProgWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, {GreatProgWeb.LayoutView, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", GreatProgWeb do
    pipe_through(:browser)

    live("/", HomeLive, :index)
    live("/blog", BlogLive.Index, :index)
    live("/blog/:id", BlogLive.Show, :show)
    live("/100_calls_challenge", CallsChallengeLive.Index, :index)

    # Core Values Exercise route
    live("/exercises/core-values", ValuesExerciseLive, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", GreatProgWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Application.compile_env(:great_prog, :env) in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through(:browser)
      live_dashboard("/dashboard", metrics: GreatProgWeb.Telemetry, ecto_repos: [GreatProg.Repo])
    end
  end
end
