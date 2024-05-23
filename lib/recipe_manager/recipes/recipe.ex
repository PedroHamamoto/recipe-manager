defmodule RecipeManager.Recipes.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "recipes" do
    field :name, :string
    field :preparation_time, :integer
    field :servings, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(recipe, attrs) do
    recipe
    |> cast(attrs, [:name, :preparation_time, :servings])
    |> validate_required([:name, :preparation_time, :servings])
  end
end
