defmodule Backllo.V2.BcklogApiController do
  use Backllo.Web, :controller

  alias Backllo.BacklogApiRequest
  alias Backllo.BacklogApi

  def issues(conn, %{"id" => id}) do

    {:ok, data} = %BacklogApiRequest{params: [{:"statusId[]", id}]}
                  |> BacklogApi.add_api_key()
                  |> BacklogApi.generate_url("issues")
                  |> BacklogApi.get()

    json conn, data
  end

  def statuses(conn, _params) do

    {:ok, data} = %BacklogApiRequest{params: [{:test, "test"}]}
                  |> BacklogApi.add_api_key()
                  |> BacklogApi.generate_url("statuses")
                  |> BacklogApi.get()

    json conn, Enum.filter(data, &(&1["name"] != "完了"))
  end
end
