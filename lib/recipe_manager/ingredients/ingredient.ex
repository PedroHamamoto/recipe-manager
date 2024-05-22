defmodule RecipeManager.Ingredients.Ingredient do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "ingredients" do
    field :name, :string
    field :price, :float
    field :purchase_link, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(ingredient, attrs) do
    ingredient
    |> cast(attrs, [:name, :price, :purchase_link])
    |> validate_required([:name, :price, :purchase_link])
  end
end
