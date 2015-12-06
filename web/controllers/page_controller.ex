defmodule Mousiki.PageController do
  use Mousiki.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
