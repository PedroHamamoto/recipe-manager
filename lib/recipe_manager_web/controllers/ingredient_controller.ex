defmodule RecipeManagerWeb.IngredientController do
  use RecipeManagerWeb, :controller

  alias RecipeManager.Ingredients
  alias RecipeManager.Ingredients.Ingredient

  action_fallback RecipeManagerWeb.FallbackController

  def show_all(conn, _params) do
    ingredients = Ingredients.list_ingredients()
    render(conn, :show_all, ingredients: ingredients)
  end

  def create(conn, ingredient_params) do
    with {:ok, %Ingredient{} = ingredient} <- Ingredients.create_ingredient(ingredient_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/ingredients/#{ingredient}")
      |> render(:show, ingredient: ingredient)
    end
  end

  def show(conn, %{"id" => id}) do
    ingredient = Ingredients.get_ingredient!(id)
    render(conn, :show, ingredient: ingredient)
  end

  def update(conn, %{"id" => id, "ingredient" => ingredient_params}) do
    ingredient = Ingredients.get_ingredient!(id)

    with {:ok, %Ingredient{} = ingredient} <- Ingredients.update_ingredient(ingredient, ingredient_params) do
      render(conn, :show, ingredient: ingredient)
    end
  end

  def delete(conn, %{"id" => id}) do
    ingredient = Ingredients.get_ingredient!(id)

    with {:ok, %Ingredient{}} <- Ingredients.delete_ingredient(ingredient) do
      send_resp(conn, :no_content, "")
    end
  end
end
