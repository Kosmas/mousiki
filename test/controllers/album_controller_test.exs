defmodule Mousiki.AlbumControllerTest do
  use Mousiki.ConnCase, async: true

  alias Mousiki.{Repo, Album}

  test "index/2 responds with all Albums", %{conn: conn} do
    albums = [ Album.changeset(%Album{}, %{title: "Toy", disc_id: "1", year: "2015-01-01", genre_id: 1, format: 1}),
               Album.changeset(%Album{}, %{title: "Spoke", disc_id: "2", year: "2011-01-01", genre_id: 1, format: 1}) ]

    Enum.each(albums, &Repo.insert!(&1))

    response = conn
    |> get(album_path(conn, :index))
    |> html_response(200)

    expected = %{
      "data" => [
        %{ "title" => "Toy", disc_id: "1", year: "2015-01-01", genre_id: 1, format: 1},
        %{ "title" => "Spoke", disc_id: "2", year: "2011-01-01", genre_id: 1, format: 1}
      ]
    }

    assert response == expected
  end

  describe "create/2" do
    test "Creates, and responds with a newly created album if attributes are valid"
    test "Returns an error and does not create a user if attributes are invalid"
  end

  describe "show/2" do
    test "Responds with a newly created album if the album is found"
    test "Responds with a message indicating album not found"
  end

  describe "update/2" do
    test "Edits, and responds with the album if attributes are valid"
    test "Returns an error and does not edit the album if attributes are invalid"
  end

  test "delete/2 and responds with :ok if the album was deleted"

#  alias Mousiki.Album
#  @valid_attrs %{disc_id: "some content", format: 42, genre_id: 42, owned: true, title: "some content", year: "2010-04-17"}
#  @invalid_attrs %{}
#
#  setup do
#    conn = build_conn()
#    {:ok, conn: conn}
#  end
#
#  test "lists all entries on index", %{conn: conn} do
#    conn = get conn, album_path(conn, :index)
#    assert html_response(conn, 200) =~ "Listing albums"
#  end
#
#  test "renders form for new resources", %{conn: conn} do
#    conn = get conn, album_path(conn, :new)
#    assert html_response(conn, 200) =~ "New album"
#  end
#
#  @tag :pending
#  test "creates resource and redirects when data is valid", %{conn: conn} do
#    conn = post conn, album_path(conn, :create), album: @valid_attrs
#    assert redirected_to(conn) == album_path(conn, :index)
#    assert Repo.get_by(Album, @valid_attrs)
#  end
#
#  @tag :pending
#  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
#    conn = post conn, album_path(conn, :create), album: @invalid_attrs
#    assert html_response(conn, 200) =~ "New album"
#  end
#
#  @tag :pending
#  test "shows chosen resource", %{conn: conn} do
#    album = Repo.insert! %Album{}
#    conn = get conn, album_path(conn, :show, album)
#    assert html_response(conn, 200) =~ "Show album"
#  end
#
#  test "renders page not found when id is nonexistent", %{conn: conn} do
#    assert_raise Ecto.NoResultsError, fn ->
#      get conn, album_path(conn, :show, -1)
#    end
#  end
#
#  @tag :pending
#  test "renders form for editing chosen resource", %{conn: conn} do
#    album = Repo.insert! %Album{}
#    conn = get conn, album_path(conn, :edit, album)
#    assert html_response(conn, 200) =~ "Edit album"
#  end
#
#  @tag :pending
#  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
#    album = Repo.insert! %Album{}
#    conn = put conn, album_path(conn, :update, album), album: @valid_attrs
#    assert redirected_to(conn) == album_path(conn, :show, album)
#    assert Repo.get_by(Album, @valid_attrs)
#  end
#
#  @tag :pending
#  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
#    album = Repo.insert! %Album{}
#    conn = put conn, album_path(conn, :update, album), album: @invalid_attrs
#    assert html_response(conn, 200) =~ "Edit album"
#  end
#
#  test "deletes chosen resource", %{conn: conn} do
 #   album = Repo.insert! %Album{}
#    conn = delete conn, album_path(conn, :delete, album)
#    assert redirected_to(conn) == album_path(conn, :index)
#    refute Repo.get(Album, album.id)
#  end
end
