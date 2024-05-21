defmodule RecipeManager.Repo.Migrations.CreateMeasurementUnits do
  use Ecto.Migration

  def change do
    create table(:measurement_units, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :symbol, :string

      timestamps(type: :utc_datetime)
    end
  end
end
