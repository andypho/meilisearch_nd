defmodule MeilisearchNd.Search do
  alias MeilisearchNd.Http

  @doc """
  https://www.meilisearch.com/docs/reference/api/search#search-in-an-index-with-post
  """
  @spec search(Client.t(), String.t(), map()) :: Http.response()
  def search(client, index_uid, params) do
    client
    |> Http.post(["indexes", index_uid, "search"], params)
  end
end
