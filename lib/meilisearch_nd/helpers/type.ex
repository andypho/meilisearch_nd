defmodule MeilisearchNd.Helpers.Type do
  @spec cast(map, map) :: map
  def cast(data, types) do
    Enum.reduce(data, data, fn {key, value}, acc ->
      with type when not is_nil(type) <- types[key],
           {:ok, value} <- Ecto.Type.cast(type, value) do
        %{acc | key => value}
      else
        _ -> acc
      end
    end)
  end
end
