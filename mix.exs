defmodule ChunkySVG.Mixfile do
  use Mix.Project

  def project do
    [
      app: :chunky_svg,
      version: "0.1.0",
      elixir: "~> 1.0",
      deps: deps(),
      package: package(),
      description: """
        A library for drawing things with SVG
      """,
    ]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:xml_builder, "~> 2.0"},
    ]
  end

  defp package do
    [
      contributors: ["Michael Ries"],
      licenses: ["MIT"],
      links: %{github: "https://github.com/mmmries/chunky_svg"},
    ]
  end
end
