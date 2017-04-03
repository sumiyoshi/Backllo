defmodule Backllo.V1.BcklogApiController do
  use Backllo.Web, :controller

  def issues(conn, %{"id" => id}) do

    {:ok, data} = Backllo.BacklogApi.get_request_url("issues")
                  |> Backllo.BacklogApi.get()

    json conn, data
  end

  def statuses(conn, _params) do

    {:ok, data} = Backllo.BacklogApi.get_request_url("statuses")
                  |> Backllo.BacklogApi.get()

    json conn, Enum.filter(data, fn(map) -> map["name"] != "完了" end)
  end
end
