# Meilisearch Nd

**Working in Progress**

A Meilisearch client for Elixir based on [HTTPoison](https://github.com/edgurgel/httpoison).

## Installation

Add `:meilisearch_nd` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:meilisearch_nd, github: "andypho/meilisearch_nd", branch: "main"}
  ]
end
```

Then run `mix deps.get` to fetch the new dependency.

## Configuration

Add the following into your configuration file in `config/config.exs`:

```elixir
config :meilisearch_nd,
  scheme: "http",
  host: "localhost",
  port: "7700",
  key: "master-key"
```

## Getting started

```elixir
MeilisearchNd.Client.new()
|> MeilisearchNd.Index.create(%{"uid" => "movies", "primaryKey" => "id"})
```

To use an other endpoint on the go you can:
```elixir
client = MeilisearchNd.Client.new(endpoint: "http://<ip-address>:7700", key: "master-key")

MeilisearchNd.Search.search(client, %{"q" => "american ninja"})
```


## Running tests

You need version of Meilisearch (v1.9+) running locally on port 7700. A quick way of doing so is via Docker:

```
$ docker run -it --rm -p 7700:7700 getmeili/meilisearch:v1.9
```
