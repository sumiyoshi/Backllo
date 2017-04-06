defmodule Backllo.V2.BcklogApiController do
  use Backllo.Web, :controller

  alias Backllo.BacklogApiRequest
  alias Backllo.BacklogApi

  def issues(conn, %{"id" => id}) do

    case %BacklogApiRequest{params: [
      {:"statusId[]", id},
      {:sort, "updated"},
      {:count, 100},
      {:apiKey, Application.get_env(:backllo, :backlog_api_key)}
    ]}
                  |> BacklogApi.generate_url(Application.get_env(:backllo, :backlog_space_name), "issues")
                  |> BacklogApi.get()
    do
      {:ok, data} -> render(conn, "issues.json", data: data)
      {:error, errors} -> render(conn, "issues.json", errors: errors)
    end
  end

  def statuses(conn, _params) do

    case %BacklogApiRequest{params: [{:apiKey, Application.get_env(:backllo, :backlog_api_key)}]}
          |> BacklogApi.generate_url(Application.get_env(:backllo, :backlog_space_name), "statuses")
          |> BacklogApi.get()
    do
      {:ok, data} -> render(conn, "statuses.json", data: Enum.filter(data, &(&1["name"] != "完了")))
      {:error, errors} -> render(conn, "error.json", errors: errors)
    end
  end
end
