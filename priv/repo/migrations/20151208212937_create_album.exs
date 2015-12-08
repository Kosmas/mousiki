defmodule Mousiki.Repo.Migrations.CreateAlbum do
  use Ecto.Migration

  def change do
    create table(:albums) do
      add :title, :string
      add :disc_id, :string
      add :year, :date
      add :genre, :integer
      add :format, :integer
      add :owned, :boolean, default: false

      timestamps
    end

  end
end
