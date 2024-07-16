defmodule MeilisearchNd.Client do
  defstruct [:endpoint, :key]

  @type t :: %__MODULE__{endpoint: String.t(), key: String.t() | nil}

  @spec new() :: Client.t()
  def new(), do: new(MeilisearchNd.config())

  @spec new(keyword()) :: Client.t()
  def new(keywords) when is_list(keywords) do
    scheme = Keyword.get(keywords, :scheme, "http")
    host = Keyword.fetch!(keywords, :host)
    port = Keyword.fetch!(keywords, :port) |> to_integer()
    key = Keyword.get(keywords, :key)

    %__MODULE__{
      endpoint: %URI{scheme: scheme, host: host, port: port} |> URI.to_string(),
      key: key
    }
  end

  defp to_integer(term) when is_binary(term) do
    String.to_integer(term)
  end

  defp to_integer(term) when is_integer(term) do
    term
  end
end
