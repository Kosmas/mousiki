defmodule Mousiki.ArtistTest do
  use Mousiki.ModelCase

  alias Mousiki.Artist

  @valid_attrs %{first_name: "some content", full_name: "some content", last_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Artist.changeset(%Artist{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Artist.changeset(%Artist{}, @invalid_attrs)
    refute changeset.valid?
  end
end
