defmodule Mousiki.FormatTest do
  use Mousiki.ModelCase

  alias Mousiki.Format

  @valid_attrs %{description: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Format.changeset(%Format{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Format.changeset(%Format{}, @invalid_attrs)
    refute changeset.valid?
  end
end
