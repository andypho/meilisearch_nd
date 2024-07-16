defmodule MeilisearchNd.Settings.Embedders do
  @moduledoc """
  [Documentation](https://www.meilisearch.com/docs/reference/api/settings#embedders-experimental)
  """
  alias MeilisearchNd.{
    Client,
    Http
  }

  @spec get(Client.t(), String.t()) :: Http.get()
  def get(client, index_uid) do
    client
    |> Http.get(["indexes", index_uid, "settings", "embedders"])
  end

  @spec update(Client.t(), String.t(), map()) :: Http.response()
  def update(client, index_uid, params) do
    client
    |> Http.patch(["indexes", index_uid, "settings", "embedders"], params)
  end

  @spec reset(Client.t(), String.t()) :: Http.response()
  def reset(client, index_uid) do
    client
    |> Http.delete(["indexes", index_uid, "settings", "embedders"])
  end
end
