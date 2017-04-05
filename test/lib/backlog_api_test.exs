defmodule Backllo.BacklogApiTest do
  use Backllo.ConnCase

  alias Backllo.BacklogApi
  alias Backllo.BacklogApiRequest

  test "test add_api_key" do
    struct = %BacklogApiRequest{params: [test: "test"]} |> BacklogApi.add_api_key()
    assert Keyword.fetch!(struct.params, :apiKey) == "test_key"
  end

  test "test generate_url" do
    struct = %BacklogApiRequest{} |> BacklogApi.generate_url("test")
    assert struct.url == "https://test.backlog.jp/api/v2/test"
  end
end
