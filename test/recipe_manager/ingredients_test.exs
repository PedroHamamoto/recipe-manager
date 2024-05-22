defmodule RecipeManager.IngredientsTest do
  use RecipeManager.DataCase

  alias RecipeManager.Ingredients

  describe "ingredients" do
    alias RecipeManager.Ingredients.Ingredient

    import RecipeManager.IngredientsFixtures

    @invalid_attrs %{name: nil, price: nil, purchase_link: nil}

    test "list_ingredients/0 returns all ingredients" do
      ingredient = ingredient_fixture()
      assert Ingredients.list_ingredients() == [ingredient]
    end

    test "get_ingredient!/1 returns the ingredient with given id" do
      ingredient = ingredient_fixture()
      assert Ingredients.get_ingredient!(ingredient.id) == ingredient
    end

    test "create_ingredient/1 with valid data creates a ingredient" do
      valid_attrs = %{name: "some name", price: 120.5, purchase_link: "some purchase_link"}

      assert {:ok, %Ingredient{} = ingredient} = Ingredients.create_ingredient(valid_attrs)
      assert ingredient.name == "some name"
      assert ingredient.price == 120.5
      assert ingredient.purchase_link == "some purchase_link"
    end

    test "create_ingredient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Ingredients.create_ingredient(@invalid_attrs)
    end

    test "update_ingredient/2 with valid data updates the ingredient" do
      ingredient = ingredient_fixture()
      update_attrs = %{name: "some updated name", price: 456.7, purchase_link: "some updated purchase_link"}

      assert {:ok, %Ingredient{} = ingredient} = Ingredients.update_ingredient(ingredient, update_attrs)
      assert ingredient.name == "some updated name"
      assert ingredient.price == 456.7
      assert ingredient.purchase_link == "some updated purchase_link"
    end

    test "update_ingredient/2 with invalid data returns error changeset" do
      ingredient = ingredient_fixture()
      assert {:error, %Ecto.Changeset{}} = Ingredients.update_ingredient(ingredient, @invalid_attrs)
      assert ingredient == Ingredients.get_ingredient!(ingredient.id)
    end

    test "delete_ingredient/1 deletes the ingredient" do
      ingredient = ingredient_fixture()
      assert {:ok, %Ingredient{}} = Ingredients.delete_ingredient(ingredient)
      assert_raise Ecto.NoResultsError, fn -> Ingredients.get_ingredient!(ingredient.id) end
    end

    test "change_ingredient/1 returns a ingredient changeset" do
      ingredient = ingredient_fixture()
      assert %Ecto.Changeset{} = Ingredients.change_ingredient(ingredient)
    end
  end
end
