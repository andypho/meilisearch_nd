defmodule MeilisearchNd.Settings.Dictionary do
  @moduledoc """
  [Documentation](https://www.meilisearch.com/docs/reference/api/settings#dictionary)
  """

  alias MeilisearchNd.{
    Client,
    Http
  }

  @spec get(Client.t(), String.t()) :: Http.get()
  def get(client, index_uid) do
    client
    |> Http.get(["indexes", index_uid, "settings", "dictionary"])
  end

  @spec update(Client.t(), String.t(), list()) :: Http.response()
  def update(client, index_uid, params) do
    client
    |> Http.put(["indexes", index_uid, "settings", "dictionary"], params)
  end

  @spec reset(Client.t(), String.t()) :: Http.response()
  def reset(client, index_uid) do
    client
    |> Http.delete(["indexes", index_uid, "settings", "dictionary"])
  end
end
