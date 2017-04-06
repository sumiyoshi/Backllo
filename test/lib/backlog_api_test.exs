defmodule Backllo.BacklogApiTest do
  use Backllo.ConnCase

  alias Backllo.BacklogApi
  alias Backllo.BacklogApiRequest

  test "test generate_url" do
    struct = %BacklogApiRequest{} |> BacklogApi.generate_url("test", "test")
    assert struct.url == "https://test.backlog.jp/api/v2/test"
  end
end
