defmodule RecipeManagerWeb.MeasurementUnitJSON do
  alias RecipeManager.MeasurementUnits.MeasurementUnit

  @doc """
  Renders a list of measurement_units.
  """
  def index(%{measurement_units: measurement_units}) do
    %{data: for(measurement_unit <- measurement_units, do: data(measurement_unit))}
  end

  @doc """
  Renders a single measurement_unit.
  """
  def show(%{measurement_unit: measurement_unit}) do
    %{data: data(measurement_unit)}
  end

  defp data(%MeasurementUnit{} = measurement_unit) do
    %{
      id: measurement_unit.id,
      name: measurement_unit.name,
      symbol: measurement_unit.symbol
    }
  end
end
