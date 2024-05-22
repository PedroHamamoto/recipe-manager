defmodule RecipeManagerWeb.IngredientControllerTest do
  use RecipeManagerWeb.ConnCase

  import RecipeManager.IngredientsFixtures

  alias RecipeManager.Ingredients.Ingredient

  @create_attrs %{
    name: "some name",
    price: 120.5,
    purchase_link: "some purchase_link"
  }
  @update_attrs %{
    name: "some updated name",
    price: 456.7,
    purchase_link: "some updated purchase_link"
  }
  @invalid_attrs %{name: nil, price: nil, purchase_link: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all ingredients", %{conn: conn} do
      conn = get(conn, ~p"/api/ingredients")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create ingredient" do
    test "renders ingredient when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/ingredients", ingredient: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/ingredients/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name",
               "price" => 120.5,
               "purchase_link" => "some purchase_link"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/ingredients", ingredient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update ingredient" do
    setup [:create_ingredient]

    test "renders ingredient when data is valid", %{conn: conn, ingredient: %Ingredient{id: id} = ingredient} do
      conn = put(conn, ~p"/api/ingredients/#{ingredient}", ingredient: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/ingredients/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "price" => 456.7,
               "purchase_link" => "some updated purchase_link"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, ingredient: ingredient} do
      conn = put(conn, ~p"/api/ingredients/#{ingredient}", ingredient: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete ingredient" do
    setup [:create_ingredient]

    test "deletes chosen ingredient", %{conn: conn, ingredient: ingredient} do
      conn = delete(conn, ~p"/api/ingredients/#{ingredient}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/ingredients/#{ingredient}")
      end
    end
  end

  defp create_ingredient(_) do
    ingredient = ingredient_fixture()
    %{ingredient: ingredient}
  end
end
