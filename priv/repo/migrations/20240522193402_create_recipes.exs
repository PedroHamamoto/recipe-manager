defmodule RecipeManager.Repo.Migrations.CreateRecipes do
  use Ecto.Migration

  def change do
    create table(:recipes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :preparation_time, :integer
      add :servings, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
