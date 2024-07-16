defmodule MeilisearchNd.Document do
  alias MeilisearchNd.{
    Client,
    Http
  }

  @doc """
  [Documentation](https://www.meilisearch.com/docs/reference/api/documents#get-documents-with-post)

  ## Examples
    iex> url = MeilisearchNd.new()
    iex> MeilisearchNd.Document.get_documents("products", %{})
    {:ok, %HTTPoison.Response{...}}
  """
  @spec get_documents(Client.t(), String.t(), map()) :: Http.response()
  def get_documents(client, index_uid, params) do
    client
    |> Http.post(["indexes", index_uid, "documents", "fetch"], params)
  end

  @spec get(Client.t(), Stiring.t(), String.t()) :: Http.get()
  def get(client, index_uid, document_id) do
    client
    |> Http.get(["indexes", index_uid, "documents", document_id])
  end

  @spec add_or_replace(Client.t(), String.t(), map()) :: Http.response()
  def add_or_replace(client, index_uid, params) do
    client
    |> Http.post(["indexes", index_uid, "documents"], params)
  end

  @spec add_or_delete(Client.t(), String.t(), map()) :: Http.response()
  def add_or_delete(client, index_uid, params) do
    client
    |> Http.put(["indexes", index_uid, "documents"], params)
  end

  @spec delete(Client.t(), String.t(), String.t() | nil) :: Http.response()
  def delete(client, index_uid, document_id \\ nil) do
    client
    |> Http.delete(["indexes", index_uid, "documents", document_id] |> Enum.filter(& &1))
  end
end
