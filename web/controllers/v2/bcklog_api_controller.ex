defmodule Backllo.V2.BcklogApiController do
  use Backllo.Web, :controller

  def issues(conn, %{"id" => id}) do

    {:ok, data} = Backllo.BacklogApi.get_request_url("issues")
                  |> Backllo.BacklogApi.get([], params: [{:"statusId[]", id},{:apiKey, Application.get_env(:backllo, :backlog_api_key)}])

    json conn, data
  end

  def statuses(conn, _params) do

    {:ok, data} = Backllo.BacklogApi.get_request_url("statuses")
                  |> Backllo.BacklogApi.get([], params: [{:apiKey, Application.get_env(:backllo, :backlog_api_key)}])

    json conn, Enum.filter(data, fn(map) -> map["name"] != "完了" end)
  end
end
