defmodule Backllo.Router do
  use Backllo.Web, :router

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

  scope "/", Backllo do
    pipe_through :browser

    get "/", PageController, :index
  end

   scope "/backlog_api", Backllo do
     pipe_through :api

     scope "/v1", V1, as: :v1 do
        get "/issues/:id", BcklogApiController, :issues
        get "/statuses", BcklogApiController, :statuses
     end
   end
end
