defmodule RecipeManager.MeasurementUnits.MeasurementUnit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "measurement_units" do
    field :name, :string
    field :symbol, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(measurement_unit, attrs) do
    measurement_unit
    |> cast(attrs, [:name, :symbol])
    |> validate_required([:name, :symbol])
  end
end
