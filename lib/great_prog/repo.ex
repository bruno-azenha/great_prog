defmodule GreatProg.Repo do
  use Ecto.Repo,
    otp_app: :great_prog,
    adapter: Ecto.Adapters.Postgres
end
