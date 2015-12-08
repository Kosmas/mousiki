defmodule Mousiki.Repo.Migrations.CreateSong do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :disc_no, :integer
      add :title, :string
      add :duration, :integer

      timestamps
    end

  end
end
