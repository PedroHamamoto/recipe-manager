defmodule RecipeManager.Repo do
  use Ecto.Repo,
    otp_app: :recipe_manager,
    adapter: Ecto.Adapters.Postgres
end
