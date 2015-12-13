defmodule Mousiki.Album do
  use Mousiki.Web, :model

  schema "albums" do
    field :title, :string
    field :disc_id, :string
    field :year, Ecto.Date
    field :genre, :integer
    field :format, :integer
    field :owned, :boolean, default: false
    belongs_to :artist, Mousiki.Artist

    timestamps
  end

  @required_fields ~w(title disc_id year genre format owned)
  @optional_fields ~w()

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
