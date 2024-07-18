defmodule MeilisearchNd.MixProject do
  use Mix.Project

  @source_url "https://github.com/andypho/meilisearch_nd"
  @version "0.1.0"

  def project do
    [
      app: :meilisearch_nd,
      version: @version,
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      doc: doc()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.11"},
      {:ex_doc, "~> 0.32.2", only: :dev, runtime: false},
      {:httpoison, "~> 1.4"},
      {:jason, "~> 1.0"}
    ]
  end

  defp doc do
    [
      main: "readme",
      extras: ["README.md"],
      source_ref: "v#{@version}",
      source_url: @source_url,
      groups_for_modules: [
        Settings: [
          MeilisearchNd.Settings
        ]
      ]
    ]
  end
end
