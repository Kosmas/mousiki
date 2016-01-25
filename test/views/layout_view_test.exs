defmodule Mousiki.LayoutViewTest do
  use Mousiki.ConnCase, async: true

  test "contains Artists link" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Artists"
  end

  test "contains Albums link" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Albums"
  end

  test "contains Songs link" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~  "Songs"
  end

  test "contains Formats link" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Formats"
  end

  test "contains Genre link" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Genres"
  end
end