defmodule MeilisearchNd.HTTPoison do
  use HTTPoison.Base

  def process_request_body(body) do
    Jason.encode!(body)
  end

  def process_request_headers(headers) do
    [{"Content-Type", "application/json"} | headers]
  end

  def process_response_body(body) do
    case Jason.decode(body) do
      {:ok, body} -> body
      _ -> body
    end
  end
end
