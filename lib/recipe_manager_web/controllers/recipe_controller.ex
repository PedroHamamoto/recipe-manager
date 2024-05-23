defmodule RecipeManagerWeb.RecipeController do
  use RecipeManagerWeb, :controller

  alias RecipeManager.Recipes
  alias RecipeManager.Recipes.Recipe

  action_fallback RecipeManagerWeb.FallbackController

  def show_all(conn, _params) do
    recipes = Recipes.list_recipes()
    render(conn, :show_all, recipes: recipes)
  end

  def create(conn, recipe_params) do
    with {:ok, %Recipe{} = recipe} <- Recipes.create_recipe(recipe_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/recipes/#{recipe}")
      |> render(:show, recipe: recipe)
    end
  end

  def show(conn, %{"id" => id}) do
    recipe = Recipes.get_recipe!(id)
    render(conn, :show, recipe: recipe)
  end
end
