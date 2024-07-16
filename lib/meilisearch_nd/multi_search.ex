defmodule MeilisearchNd.MultiSearch do
  alias MeilisearchNd.Client
  alias MeilisearchNd.Http

  @type search_params() :: %{
          :indexUid => String.t(),
          :q => String.t(),
          :offset => integer(),
          :limit => integer(),
          :hitsPerPage => integer(),
          :page => integer(),
          :filter => String.t(),
          :facets => [String.t()],
          :attributesToRetrieve => [String.t()],
          :attributesToCrop => [String.t()],
          :cropLength => integer(),
          :cropMarker => String.t(),
          :attributesToHighlight => [String.t()],
          :highlightPreTag => String.t(),
          :highlightPostTag => String.t(),
          :showMatchesPosition => bool(),
          :sort => [String.t()],
          :matchingStrategy => String.t(),
          :showRankingScore => bool(),
          :attributesToSearchOn => [String.t()]
        }

  @spec multi_search(Client.t(), list(search_params())) :: Http.response()
  def multi_search(client, queries) when is_list(queries) do
    client
    |> Http.post(["multi-search"], %{"queries" => queries})
  end
end
