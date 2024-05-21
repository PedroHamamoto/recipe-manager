defmodule RecipeManagerWeb.MeasurementUnitControllerTest do
  use RecipeManagerWeb.ConnCase

  import RecipeManager.MeasurementUnitsFixtures

  alias RecipeManager.MeasurementUnits.MeasurementUnit

  @create_attrs %{
    name: "some name",
    symbol: "some symbol"
  }
  @update_attrs %{
    name: "some updated name",
    symbol: "some updated symbol"
  }
  @invalid_attrs %{name: nil, symbol: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all measurement_units", %{conn: conn} do
      conn = get(conn, ~p"/api/measurement_units")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create measurement_unit" do
    test "renders measurement_unit when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/measurement_units", measurement_unit: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/measurement_units/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name",
               "symbol" => "some symbol"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/measurement_units", measurement_unit: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update measurement_unit" do
    setup [:create_measurement_unit]

    test "renders measurement_unit when data is valid", %{conn: conn, measurement_unit: %MeasurementUnit{id: id} = measurement_unit} do
      conn = put(conn, ~p"/api/measurement_units/#{measurement_unit}", measurement_unit: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/measurement_units/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "symbol" => "some updated symbol"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, measurement_unit: measurement_unit} do
      conn = put(conn, ~p"/api/measurement_units/#{measurement_unit}", measurement_unit: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete measurement_unit" do
    setup [:create_measurement_unit]

    test "deletes chosen measurement_unit", %{conn: conn, measurement_unit: measurement_unit} do
      conn = delete(conn, ~p"/api/measurement_units/#{measurement_unit}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/measurement_units/#{measurement_unit}")
      end
    end
  end

  defp create_measurement_unit(_) do
    measurement_unit = measurement_unit_fixture()
    %{measurement_unit: measurement_unit}
  end
end
