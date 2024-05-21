defmodule RecipeManager.MeasurementUnitsTest do
  use RecipeManager.DataCase

  alias RecipeManager.MeasurementUnits

  describe "measurement_units" do
    alias RecipeManager.MeasurementUnits.MeasurementUnit

    import RecipeManager.MeasurementUnitsFixtures

    @invalid_attrs %{name: nil, symbol: nil}

    test "list_measurement_units/0 returns all measurement_units" do
      measurement_unit = measurement_unit_fixture()
      assert MeasurementUnits.list_measurement_units() == [measurement_unit]
    end

    test "get_measurement_unit!/1 returns the measurement_unit with given id" do
      measurement_unit = measurement_unit_fixture()
      assert MeasurementUnits.get_measurement_unit!(measurement_unit.id) == measurement_unit
    end

    test "create_measurement_unit/1 with valid data creates a measurement_unit" do
      valid_attrs = %{name: "some name", symbol: "some symbol"}

      assert {:ok, %MeasurementUnit{} = measurement_unit} = MeasurementUnits.create_measurement_unit(valid_attrs)
      assert measurement_unit.name == "some name"
      assert measurement_unit.symbol == "some symbol"
    end

    test "create_measurement_unit/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = MeasurementUnits.create_measurement_unit(@invalid_attrs)
    end

    test "update_measurement_unit/2 with valid data updates the measurement_unit" do
      measurement_unit = measurement_unit_fixture()
      update_attrs = %{name: "some updated name", symbol: "some updated symbol"}

      assert {:ok, %MeasurementUnit{} = measurement_unit} = MeasurementUnits.update_measurement_unit(measurement_unit, update_attrs)
      assert measurement_unit.name == "some updated name"
      assert measurement_unit.symbol == "some updated symbol"
    end

    test "update_measurement_unit/2 with invalid data returns error changeset" do
      measurement_unit = measurement_unit_fixture()
      assert {:error, %Ecto.Changeset{}} = MeasurementUnits.update_measurement_unit(measurement_unit, @invalid_attrs)
      assert measurement_unit == MeasurementUnits.get_measurement_unit!(measurement_unit.id)
    end

    test "delete_measurement_unit/1 deletes the measurement_unit" do
      measurement_unit = measurement_unit_fixture()
      assert {:ok, %MeasurementUnit{}} = MeasurementUnits.delete_measurement_unit(measurement_unit)
      assert_raise Ecto.NoResultsError, fn -> MeasurementUnits.get_measurement_unit!(measurement_unit.id) end
    end

    test "change_measurement_unit/1 returns a measurement_unit changeset" do
      measurement_unit = measurement_unit_fixture()
      assert %Ecto.Changeset{} = MeasurementUnits.change_measurement_unit(measurement_unit)
    end
  end
end
