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

#  alias Mousiki.Artist
#  @valid_attrs %{first_name: "some content", full_name: "some content", last_name: "some content"}
#  @invalid_attrs %{}
#
#  setup do
#    conn = conn()
#    {:ok, conn: conn}
#  end#
#
#  test "lists all entries on index", %{conn: conn} do
#    conn = get conn, artist_path(conn, :index)
#    assert html_response(conn, 200) =~ "Listing artists"
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
#
#  test "deletes chosen resource", %{conn: conn} do
#    artist = Repo.insert! %Artist{}
#    conn = delete conn, artist_path(conn, :delete, artist)
#    assert redirected_to(conn) == artist_path(conn, :index)
#    refute Repo.get(Artist, artist.id)
#  end
end
