defmodule RecipeManager.Repo.Migrations.CreateIngredients do
  use Ecto.Migration

  def change do
    create table(:ingredients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :price, :float
      add :purchase_link, :string

      timestamps(type: :utc_datetime)
    end
  end
end
