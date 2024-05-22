defmodule RecipeManagerWeb.IngredientJSON do
  alias RecipeManager.Ingredients.Ingredient

  @doc """
  Renders a list of ingredients.
  """
  def show_all(%{ingredients: ingredients}) do
    for(ingredient <- ingredients, do: data(ingredient))
  end

  @doc """
  Renders a single ingredient.
  """
  def show(%{ingredient: ingredient}) do
    data(ingredient)
  end

  defp data(%Ingredient{} = ingredient) do
    %{
      id: ingredient.id,
      name: ingredient.name,
      price: ingredient.price,
      purchase_link: ingredient.purchase_link
    }
  end
end
