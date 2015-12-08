defmodule Mousiki.AlbumTest do
  use Mousiki.ModelCase

  alias Mousiki.Album

  @valid_attrs %{disc_id: "some content", format: 42, genre: 42, owned: true, title: "some content", year: "2010-04-17"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Album.changeset(%Album{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Album.changeset(%Album{}, @invalid_attrs)
    refute changeset.valid?
  end
end
