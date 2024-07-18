defmodule MeilisearchNd.Index do
  @moduledoc """
  [Documentation](https://www.meilisearch.com/docs/reference/api/indexes)
  """

  defmodule Object do
    alias MeilisearchNd.Helpers

    @types %{
      "uid" => :string,
      "primaryKey" => :string,
      "createdAt" => :utc_datetime,
      "updatedAt" => :utc_datetime
    }

    def get_type, do: {:parameterized, __MODULE__, @types}

    def cast(data, types \\ @types) do
      {:ok, Helpers.Type.cast(data, types)}
    end
  end

  alias MeilisearchNd.{
    Client,
    Helpers,
    Http
  }

  @path "indexes"
  @types %{
    "limit" => :integer,
    "offset" => :integer,
    "total" => :integer,
    "results" => {:array, __MODULE__.Object.get_type()}
  }

  @spec cast(map(), map()) :: {:ok, map()}
  def cast(data, types \\ @types) do
    {:ok, Helpers.Type.cast(data, types)}
  end

  @spec get(Client.t()) :: Http.get()
  def get(client) do
    client
    |> Http.get([@path])
    |> Http.handle_response_body(&cast/1)
  end

  @spec get(Client.t(), String.t()) :: Http.get()
  def get(client, index_uid) do
    client
    |> Http.get([@path, index_uid])
    |> Http.handle_response_body(&__MODULE__.Object.cast/1)
  end

  @spec create(Client.t(), %{uid: String.t(), primaryKey: String.t() | nil}) :: Http.response()
  def create(client, params) do
    client
    |> Http.post([@path], params)
  end

  @spec update(Client.t(), String.t(), map()) :: Http.response()
  def update(client, index_uid, params) do
    client
    |> Http.patch([@path, index_uid], params)
  end

  @spec delete(Client.t(), String.t()) :: Http.response()
  def delete(client, index_uid) do
    client
    |> Http.delete([@path, index_uid])
  end

  @spec swap(Client.t(), list()) :: Http.response()
  def swap(client, params) do
    Http.post(client, ["/swap-indexes"], params)
  end
end
