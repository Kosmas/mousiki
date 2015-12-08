defmodule Mousiki.Repo.Migrations.CreateFormat do
  use Ecto.Migration

  def change do
    create table(:formats) do
      add :description, :string

      timestamps
    end

  end
end
