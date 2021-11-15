defmodule Public.Router do
  use Public, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {Public.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Public do
    pipe_through :browser

    live "/", PageLive, :index

    live "/producto", ProductoLive.Index, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Public do
  #   pipe_through :api
  # end
end
