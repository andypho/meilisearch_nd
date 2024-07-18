defmodule MeilisearchNd.Task do
  defmodule Object do
    alias MeilisearchNd.Helpers

    @types %{
      "uid" => :integer,
      "indexUid" => :string,
      "status" => :string,
      "type" => :string,
      "canceledBy" => :integer,
      "details" => {:map, :any},
      "error" => {:map, :any},
      "duration" => :string,
      "enqueuedAt" => :utc_datetime,
      "startedAt" => :utc_datetime,
      "finishedAt" => :utc_datetime
    }

    def get_type, do: {:parameterized, __MODULE__, @types}

    @spec cast(map(), map()) :: {:ok, map()}
    def cast(data, types \\ @types) do
      {:ok, Helpers.Type.cast(data, types)}
    end
  end
end
