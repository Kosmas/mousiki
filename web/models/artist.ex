defmodule Mousiki.Artist do
  use Mousiki.Web, :model

  schema "artists" do
    field :full_name, :string
    field :first_name, :string
    field :last_name, :string
    has_many :albums, Mousiki.Album

    timestamps
  end

  @required_fields ~w(full_name)
  @optional_fields ~w(first_name last_name)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
