defmodule RecipeManagerWeb.MeasurementUnitController do
  use RecipeManagerWeb, :controller

  alias RecipeManager.MeasurementUnits
  alias RecipeManager.MeasurementUnits.MeasurementUnit

  action_fallback RecipeManagerWeb.FallbackController

  def index(conn, _params) do
    measurement_units = MeasurementUnits.list_measurement_units()
    render(conn, :index, measurement_units: measurement_units)
  end

  def create(conn, %{"measurement_unit" => measurement_unit_params}) do
    with {:ok, %MeasurementUnit{} = measurement_unit} <- MeasurementUnits.create_measurement_unit(measurement_unit_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/measurement_units/#{measurement_unit}")
      |> render(:show, measurement_unit: measurement_unit)
    end
  end

  def show(conn, %{"id" => id}) do
    measurement_unit = MeasurementUnits.get_measurement_unit!(id)
    render(conn, :show, measurement_unit: measurement_unit)
  end

  def update(conn, %{"id" => id, "measurement_unit" => measurement_unit_params}) do
    measurement_unit = MeasurementUnits.get_measurement_unit!(id)

    with {:ok, %MeasurementUnit{} = measurement_unit} <- MeasurementUnits.update_measurement_unit(measurement_unit, measurement_unit_params) do
      render(conn, :show, measurement_unit: measurement_unit)
    end
  end

  def delete(conn, %{"id" => id}) do
    measurement_unit = MeasurementUnits.get_measurement_unit!(id)

    with {:ok, %MeasurementUnit{}} <- MeasurementUnits.delete_measurement_unit(measurement_unit) do
      send_resp(conn, :no_content, "")
    end
  end
end
