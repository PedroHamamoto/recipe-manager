defmodule RecipeManagerWeb.RecipeJSON do
  alias RecipeManager.Recipes.Recipe

  @doc """
  Renders a list of recipes.
  """
  def show_all(%{recipes: recipes}) do
    for(recipe <- recipes, do: data(recipe))
  end

  @doc """
  Renders a single recipe.
  """
  def show(%{recipe: recipe}) do
    data(recipe)
  end

  defp data(%Recipe{} = recipe) do
    %{
      id: recipe.id,
      name: recipe.name,
      preparation_time: recipe.preparation_time,
      servings: recipe.servings
    }
  end
end
