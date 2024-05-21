defmodule RecipeManager.MeasurementUnitsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `RecipeManager.MeasurementUnits` context.
  """

  @doc """
  Generate a measurement_unit.
  """
  def measurement_unit_fixture(attrs \\ %{}) do
    {:ok, measurement_unit} =
      attrs
      |> Enum.into(%{
        name: "some name",
        symbol: "some symbol"
      })
      |> RecipeManager.MeasurementUnits.create_measurement_unit()

    measurement_unit
  end
end
