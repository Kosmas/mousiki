defmodule Mousiki.GenreTest do
  use Mousiki.ModelCase

  alias Mousiki.Genre

  @valid_attrs %{description: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Genre.changeset(%Genre{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Genre.changeset(%Genre{}, @invalid_attrs)
    refute changeset.valid?
  end
end
