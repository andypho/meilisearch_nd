defmodule MeilisearchNd.Settings do
  @moduledoc """
  [Documentation](https://www.meilisearch.com/docs/reference/api/settings#all-settings)
  """

  alias MeilisearchNd.{
    Client,
    Http
  }

  @spec get(Client.t(), String.t()) :: Http.get()
  def get(client, index_uid) do
    client
    |> Http.get(["indexes", index_uid, "settings"])
  end

  @spec update(Client.t(), String.t(), map()) :: Http.response()
  def update(client, index_uid, params) do
    client
    |> Http.patch(["indexes", index_uid, "settings"], params)
  end

  @spec reset(Client.t(), String.t()) :: Http.response()
  def reset(client, index_uid) do
    client
    |> Http.delete(["indexes", index_uid, "settings"])
  end
end
