defmodule RecipeManagerWeb.Router do
  use RecipeManagerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RecipeManagerWeb do
    pipe_through :api
    get "/measurement-units", MeasurementUnitController, :show_all
    get "/measurement-units/:id", MeasurementUnitController, :show
    post "/measurement-units", MeasurementUnitController, :create

    get "/ingredients", IngredientController, :show_all
    get "/ingredients/:id", IngredientController, :show
    post "/ingredients", IngredientController, :create
  end
end
