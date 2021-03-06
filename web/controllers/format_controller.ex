defmodule Mousiki.FormatController do
  use Mousiki.Web, :controller

  alias Mousiki.Format

  plug :scrub_params, "format" when action in [:create, :update]

  def index(conn, _params) do
    formats = Repo.all(Format)
    render(conn, "index.html", formats: formats)
  end

  def new(conn, _params) do
    changeset = Format.changeset(%Format{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"format" => format_params}) do
    changeset = Format.changeset(%Format{}, format_params)

    case Repo.insert(changeset) do
      {:ok, _format} ->
        conn
        |> put_flash(:info, "Format created successfully.")
        |> redirect(to: format_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    format = Repo.get!(Format, id)
    render(conn, "show.html", format: format)
  end

  def edit(conn, %{"id" => id}) do
    format = Repo.get!(Format, id)
    changeset = Format.changeset(format)
    render(conn, "edit.html", format: format, changeset: changeset)
  end

  def update(conn, %{"id" => id, "format" => format_params}) do
    format = Repo.get!(Format, id)
    changeset = Format.changeset(format, format_params)

    case Repo.update(changeset) do
      {:ok, format} ->
        conn
        |> put_flash(:info, "Format updated successfully.")
        |> redirect(to: format_path(conn, :show, format))
      {:error, changeset} ->
        render(conn, "edit.html", format: format, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    format = Repo.get!(Format, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(format)

    conn
    |> put_flash(:info, "Format deleted successfully.")
    |> redirect(to: format_path(conn, :index))
  end
end
