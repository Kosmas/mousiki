defmodule Mousiki.Repo.Migrations.CreateArtist do
  use Ecto.Migration

  def change do
    create table(:artists) do
      add :full_name, :string
      add :first_name, :string
      add :last_name, :string

      timestamps
    end

  end
end
