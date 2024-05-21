defmodule RecipeManager.MeasurementUnits do
  @moduledoc """
  The MeasurementUnits context.
  """

  import Ecto.Query, warn: false
  alias RecipeManager.Repo

  alias RecipeManager.MeasurementUnits.MeasurementUnit

  @doc """
  Returns the list of measurement_units.

  ## Examples

      iex> list_measurement_units()
      [%MeasurementUnit{}, ...]

  """
  def list_measurement_units do
    Repo.all(MeasurementUnit)
  end

  @doc """
  Gets a single measurement_unit.

  Raises `Ecto.NoResultsError` if the Measurement unit does not exist.

  ## Examples

      iex> get_measurement_unit!(123)
      %MeasurementUnit{}

      iex> get_measurement_unit!(456)
      ** (Ecto.NoResultsError)

  """
  def get_measurement_unit!(id), do: Repo.get!(MeasurementUnit, id)

  @doc """
  Creates a measurement_unit.

  ## Examples

      iex> create_measurement_unit(%{field: value})
      {:ok, %MeasurementUnit{}}

      iex> create_measurement_unit(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_measurement_unit(attrs \\ %{}) do
    %MeasurementUnit{}
    |> MeasurementUnit.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a measurement_unit.

  ## Examples

      iex> update_measurement_unit(measurement_unit, %{field: new_value})
      {:ok, %MeasurementUnit{}}

      iex> update_measurement_unit(measurement_unit, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_measurement_unit(%MeasurementUnit{} = measurement_unit, attrs) do
    measurement_unit
    |> MeasurementUnit.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a measurement_unit.

  ## Examples

      iex> delete_measurement_unit(measurement_unit)
      {:ok, %MeasurementUnit{}}

      iex> delete_measurement_unit(measurement_unit)
      {:error, %Ecto.Changeset{}}

  """
  def delete_measurement_unit(%MeasurementUnit{} = measurement_unit) do
    Repo.delete(measurement_unit)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking measurement_unit changes.

  ## Examples

      iex> change_measurement_unit(measurement_unit)
      %Ecto.Changeset{data: %MeasurementUnit{}}

  """
  def change_measurement_unit(%MeasurementUnit{} = measurement_unit, attrs \\ %{}) do
    MeasurementUnit.changeset(measurement_unit, attrs)
  end
end
