defmodule Mousiki.SongControllerTest do
  use Mousiki.ConnCase

  alias Mousiki.Song
  @valid_attrs %{disc_no: 42, duration: 42, title: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, song_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing songs"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, song_path(conn, :new)
    assert html_response(conn, 200) =~ "New song"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, song_path(conn, :create), song: @valid_attrs
    assert redirected_to(conn) == song_path(conn, :index)
    assert Repo.get_by(Song, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, song_path(conn, :create), song: @invalid_attrs
    assert html_response(conn, 200) =~ "New song"
  end

  test "shows chosen resource", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = get conn, song_path(conn, :show, song)
    assert html_response(conn, 200) =~ "Show song"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, song_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = get conn, song_path(conn, :edit, song)
    assert html_response(conn, 200) =~ "Edit song"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = put conn, song_path(conn, :update, song), song: @valid_attrs
    assert redirected_to(conn) == song_path(conn, :show, song)
    assert Repo.get_by(Song, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = put conn, song_path(conn, :update, song), song: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit song"
  end

  test "deletes chosen resource", %{conn: conn} do
    song = Repo.insert! %Song{}
    conn = delete conn, song_path(conn, :delete, song)
    assert redirected_to(conn) == song_path(conn, :index)
    refute Repo.get(Song, song.id)
  end
end
