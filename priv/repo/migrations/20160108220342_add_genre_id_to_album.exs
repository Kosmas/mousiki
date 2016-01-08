defmodule Mousiki.Repo.Migrations.AddGenreIdToAlbum do
  use Ecto.Migration

  def change do
    alter table(:albums) do
      remove :genre
      add :genre_id, references(:genres)
    end
  end
end
