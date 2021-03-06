defmodule Mousiki.Router do
  use Mousiki.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Mousiki do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/artists", ArtistController
    resources "/albums", AlbumController
    resources "/songs", SongController
    resources "/genres", GenreController
    resources "/formats", FormatController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Mousiki do
  #   pipe_through :api
  # end
end
