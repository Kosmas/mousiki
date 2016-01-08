defmodule Mousiki.Repo.Migrations.AddAlbumIdToSong do
  use Ecto.Migration

  def change do
    alter table(:songs) do
      add :album_id, references(:albums)
    end
  end
end
