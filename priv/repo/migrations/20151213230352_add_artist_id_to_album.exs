defmodule Mousiki.Repo.Migrations.AddArtistIdToAlbum do
  use Ecto.Migration

  def change do
    alter table(:albums) do
      add :artist_id, references(:artists)
    end
  end
end
