defmodule RecipeManagerWeb.MeasurementUnitController do
  use RecipeManagerWeb, :controller

  alias RecipeManager.MeasurementUnits
  alias RecipeManager.MeasurementUnits.MeasurementUnit

  action_fallback RecipeManagerWeb.FallbackController

  def show_all(conn, _params) do
    measurement_units = MeasurementUnits.list_measurement_units()
    render(conn, :index, measurement_units: measurement_units)
  end

  def create(conn, measurement_unit_params) do
    with {:ok, %MeasurementUnit{} = measurement_unit} <- MeasurementUnits.create_measurement_unit(measurement_unit_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/measurement-units/#{measurement_unit}")
      |> render(:show, measurement_unit: measurement_unit)
    end
  end

  def show(conn, %{"id" => id}) do
    measurement_unit = MeasurementUnits.get_measurement_unit!(id)
    render(conn, :show, measurement_unit: measurement_unit)
  end
end
