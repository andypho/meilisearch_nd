defmodule TaskTest do
  use ExUnit.Case

  test "Task Object Casting" do
    object = %{
      "canceledBy" => nil,
      "details" => %{"deletedDocuments" => 0},
      "duration" => "PT0.001192S",
      "enqueuedAt" => "2022-08-04T12:28:15.159167Z",
      "error" => %{
        "code" => "index_not_found",
        "link" => "https://docs.meilisearch.com/errors#index_not_found",
        "message" => "Index `movie` not found.",
        "type" => "invalid_request"
      },
      "finishedAt" => "2022-08-04T12:28:15.163188Z",
      "indexUid" => "movie",
      "startedAt" => "2022-08-04T12:28:15.161996Z",
      "status" => "failed",
      "type" => "indexDeletion",
      "uid" => 4
    }

    expected_object = %{
      "canceledBy" => nil,
      "details" => %{"deletedDocuments" => 0},
      "duration" => "PT0.001192S",
      "enqueuedAt" => ~U[2022-08-04 12:28:15Z],
      "error" => %{
        "code" => "index_not_found",
        "link" => "https://docs.meilisearch.com/errors#index_not_found",
        "message" => "Index `movie` not found.",
        "type" => "invalid_request"
      },
      "finishedAt" => ~U[2022-08-04 12:28:15Z],
      "indexUid" => "movie",
      "startedAt" => ~U[2022-08-04 12:28:15Z],
      "status" => "failed",
      "type" => "indexDeletion",
      "uid" => 4
    }

    assert MeilisearchNd.Task.Object.cast(object) == {:ok, expected_object}
  end
end
