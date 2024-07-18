defmodule MeilisearchNd.Http do
  alias MeilisearchNd.{
    Client,
    Http
  }

  @type response() ::
          {:ok,
           HTTPoison.Response.t() | HTTPoison.AsyncResponse.t() | HTTPoison.MaybeRedirect.t()}
          | {:error, HTTPoison.Error.t()}

  @type get() ::
          {:ok, HTTPoison.Response.t() | HTTPoison.AsyncResponse.t()}
          | {:error, HTTPoison.Error.t()}

  @spec delete(Client.t(), [String.t()], Keyword.t()) :: any()
  def delete(%Client{endpoint: endpoint, key: key}, paths, options \\ []) do
    url = Path.join([endpoint | paths])
    headers = add_auth_header(key)

    Http.Base.delete(url, headers, options)
  end

  @spec get(Client.t(), [String.t()], Keyword.t()) :: get()
  def get(%Client{endpoint: endpoint, key: key}, paths, options \\ []) do
    url = Path.join([endpoint | paths])
    headers = add_auth_header(key)

    Http.Base.get(url, headers, options)
  end

  @spec patch(Client.t(), [String.t()], any(), Keyword.t()) :: response()
  def patch(%Client{endpoint: endpoint, key: key}, paths, body, options \\ []) do
    url = Path.join([endpoint | paths])
    headers = add_auth_header(key)

    Http.Base.patch(url, body, headers, options)
  end

  @spec post(Client.t(), [String.t()], any(), Keyword.t()) :: response()
  def post(%Client{endpoint: endpoint, key: key}, paths, body, options \\ []) do
    url = Path.join([endpoint | paths])
    headers = add_auth_header(key)

    Http.Base.post(url, body, headers, options)
  end

  @spec put(Client.t(), [String.t()], any(), Keyword.t()) :: response()
  def put(%Client{endpoint: endpoint, key: key}, paths, body, options \\ []) do
    url = Path.join([endpoint | paths])
    headers = add_auth_header(key)

    Http.Base.put(url, body, headers, options)
  end

  @spec handle_response_body({:ok, HTTPoison.Response.t()}, function()) ::
          {:ok, HTTPoison.Response.t()}
  def handle_response_body({:ok, %HTTPoison.Response{body: body} = resp}, fun)
      when is_function(fun) do
    body =
      case fun.(body) do
        {:ok, body} -> body
        _ -> body
      end

    {:ok, %{resp | body: body}}
  end

  def handle_response_body(any, _fun) do
    any
  end

  defp add_auth_header(key) when is_binary(key) do
    [{"Authorization", "Bearer #{key}"}]
  end

  defp add_auth_header(_), do: []
end
