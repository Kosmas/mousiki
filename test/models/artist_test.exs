defmodule Mousiki.ArtistTest do
  use Mousiki.ModelCase

  alias Mousiki.Artist

  @valid_attrs %{first_name: "John", full_name: "John Somebody", last_name: "Somebody"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Artist.changeset(%Artist{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Artist.changeset(%Artist{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "first_name is not required" do
    changeset = Artist.changeset(%Artist{}, Map.delete(@valid_attrs, :first_name))
    assert changeset.valid?
  end

  test "last_name is not required" do
    changeset = Artist.changeset(%Artist{}, Map.delete(@valid_attrs, :last_name))
    assert changeset.valid?
  end
end
