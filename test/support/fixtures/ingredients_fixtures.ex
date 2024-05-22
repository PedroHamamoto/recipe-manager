defmodule RecipeManager.IngredientsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RecipeManager.Ingredients` context.
  """

  @doc """
  Generate a ingredient.
  """
  def ingredient_fixture(attrs \\ %{}) do
    {:ok, ingredient} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: 120.5,
        purchase_link: "some purchase_link"
      })
      |> RecipeManager.Ingredients.create_ingredient()

    ingredient
  end
end
