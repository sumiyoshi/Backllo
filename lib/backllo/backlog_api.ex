defmodule Backllo.BacklogApiRequest do
  defstruct url: nil, headers: [], params: [], form: [], file: nil
end

defmodule Backllo.BacklogApi do

  @backlog_api_url "https://%{space_name}.backlog.jp/api/v2/%{endpoint}"

  @type headers :: [{binary, binary}] | %{binary => binary}
  @type body :: binary | {:form, [{atom, any}]} | {:file, binary}

  @spec get(%Backllo.BacklogApiRequest{}) :: {Atom.t, Map.t}
  def get(struct) do
    struct.url
    |> HTTPoison.get!(struct.headers, params: struct.params)
    |> do_response_decode
    |> do_cast_response
  end

  @spec get_request_url(binary) :: binary
  def get_request_url(endpoint) do
    @backlog_api_url
    |> String.replace("%{endpoint}", endpoint)
    |> String.replace("%{space_name}", Application.get_env(:backllo, :backlog_space_name))
  end

  @spec add_api_key(%Backllo.BacklogApiRequest{}) :: %Backllo.BacklogApiRequest{}
  def add_api_key(struct) do
    %{struct | params: Keyword.put(struct.params, :apiKey, Application.get_env(:backllo, :backlog_api_key))}
  end

  @spec generate_url(%Backllo.BacklogApiRequest{}, binary) :: %Backllo.BacklogApiRequest{}
  def generate_url(struct, endpoint) do
    url = @backlog_api_url
          |> String.replace("%{endpoint}", endpoint)
          |> String.replace("%{space_name}", Application.get_env(:backllo, :backlog_space_name))

    %{struct | url: url}
  end

  @spec do_response_decode(HTTPoison.Response.t) :: Tuple.t
  defp do_response_decode(%HTTPoison.Response{body: body}), do: {Poison.decode!(body)}

  defp do_response_decode(response), do: response

  @spec do_cast_response(Tuple.Response.t) :: {Atom.t, Map.t}
  defp do_cast_response({%{"errors" => errors}}), do: {:error, errors}

  defp do_cast_response({response}), do: {:ok, response}
end