defmodule Mousiki.Song do
  use Mousiki.Web, :model

  schema "songs" do
    field :disc_no, :integer
    field :title, :string
    field :duration, :integer

    timestamps
  end

  @required_fields ~w(disc_no title duration)
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
