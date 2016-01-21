defmodule Mousiki.PageControllerTest do
  use Mousiki.ConnCase

  test "GET /" do
    conn = get conn(), "/"
    assert html_response(conn, 200) =~ "Welcome to Mousiki!"
  end
end
