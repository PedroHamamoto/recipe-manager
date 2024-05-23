defmodule RecipeManager.RecipesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RecipeManager.Recipes` context.
  """

  @doc """
  Generate a recipe.
  """
  def recipe_fixture(attrs \\ %{}) do
    {:ok, recipe} =
      attrs
      |> Enum.into(%{
        name: "some name",
        preparation_time: 42,
        servings: 42
      })
      |> RecipeManager.Recipes.create_recipe()

    recipe
  end
end
