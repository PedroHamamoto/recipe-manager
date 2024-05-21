defmodule RecipeManagerWeb.Router do
  use RecipeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RecipeManagerWeb do
    pipe_through :api
  end
end
