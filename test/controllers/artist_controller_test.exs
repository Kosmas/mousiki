require IEx
defmodule Mousiki.ArtistControllerTest do
  use Mousiki.ConnCase, asyn: true

  alias Mousiki.{Repo, Artist}

  test "index/2 responds with all Artists", %{conn: conn} do
    artists = [ Artist.changeset(%Artist{}, %{first_name: "John", full_name: "Cale"}),
                Artist.changeset(%Artist{}, %{first_name: "Peter", full_name: "Gabriel"}) ]

    Enum.each(artists, &Repo.insert!(&1))

    response = conn
    |> get(artist_path(conn, :index))
    |> html_response(200)

    assert response =~ "Listing artists"
    assert response =~ "John"
    assert response =~ "Cale"
    assert response =~ "Peter"
    assert response =~ "Gabriel"
  end

  describe "create/2" do
    test "Creates, and responds with a newly created artist if attributes are valid"
    test "Returns an error and does not create an artist if attributes are invalid"
  end

  describe "show/2" do
    test "Responds with a newly created artist if the artist is found", %{conn: conn} do
      artist = Artist.changeset(%Artist{}, %{first_name: "John", full_name: "Cale"})
      |> Repo.insert!

      response = conn
      |> get(artist_path(conn, :show, artist.id))
      |> html_response(200)

      assert response =~ "Show artist"
      assert response =~ "John"
      assert response =~ "Cale"
    end

    test "Responds with a message indicating artist not found", %{conn: conn} do
      assert_raise Ecto.NoResultsError, fn ->
        get conn, artist_path(conn, :show, -1)
      end
    end
  end

  describe "update/2" do
    test "Edits, and responds with the artist if attributes are valid"
    test "Returns an error and does not edit the artist if attributes are invalid"
  end

  test "delete/2 and responds with :ok if the artist was deleted", %{conn: conn} do
    artist = Artist.changeset(%Artist{}, %{first_name: "Nick", full_name: "Cave"})
    |> Repo.insert!

    response = conn
    |> delete(artist_path(conn, :delete, artist))
    |> html_response(302)

    assert response =~"<html><body>You are being <a href=\"/artists\">redirected</a>.</body></html>"
    refute Repo.get(Artist, artist.id)
  end


#  alias Mousiki.Artist
#  @valid_attrs %{first_name: "some content", full_name: "some content", last_name: "some content"}
#  @invalid_attrs %{}
#
#  setup do
#    conn = conn()
#    {:ok, conn: conn}
#  end#
#
#  test "renders form for new resources", %{conn: conn} do
#    conn = get conn, artist_path(conn, :new)
#    assert html_response(conn, 200) =~ "New artist"
#  end
#
#  test "creates resource and redirects when data is valid", %{conn: conn} do
#    conn = post conn, artist_path(conn, :create), artist: @valid_attrs
#    assert redirected_to(conn) == artist_path(conn, :index)
#    assert Repo.get_by(Artist, @valid_attrs)
#  end
#
#  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
#    conn = post conn, artist_path(conn, :create), artist: @invalid_attrs
#    assert html_response(conn, 200) =~ "New artist"
#  end#
#
#  test "shows chosen resource", %{conn: conn} do
#    artist = Repo.insert! %Artist{}
#    conn = get conn, artist_path(conn, :show, artist)
#    assert html_response(conn, 200) =~ "Show artist"
#  end
#
#  test "renders page not found when id is nonexistent", %{conn: conn} do
#    assert_raise Ecto.NoResultsError, fn ->
#      get conn, artist_path(conn, :show, -1)
#    end
#  end
#
#  test "renders form for editing chosen resource", %{conn: conn} do
#    artist = Repo.insert! %Artist{}
#    conn = get conn, artist_path(conn, :edit, artist)
#    assert html_response(conn, 200) =~ "Edit artist"
#  end
#
#  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
#    artist = Repo.insert! %Artist{}
#    conn = put conn, artist_path(conn, :update, artist), artist: @valid_attrs
#    assert redirected_to(conn) == artist_path(conn, :show, artist)
#    assert Repo.get_by(Artist, @valid_attrs)
#  end
#
#  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
#    artist = Repo.insert! %Artist{}
#    conn = put conn, artist_path(conn, :update, artist), artist: @invalid_attrs
#    assert html_response(conn, 200) =~ "Edit artist"
#  end#
end
