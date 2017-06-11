defmodule PetrovichElixir.Mixfile do
  use Mix.Project

  @version "0.0.1"
  @url "https://github.com/sobolevn/ecto_autoslug_field"

  def project do
    [app: :petrovich_elixir,
     version: @version,
     elixir: "~> 1.4",

     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,

     deps: deps(),

     # Hex:
     docs: docs(),
     description: description(),
     package: package(),
     source_url: @url,
     homepage_url: @url]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:poison, "~> 3.1"},

     # Dev and test dependencies:
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
     {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
     {:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp description do
    "Elixir library to inflect Russian first, last, and middle names."
  end

  defp docs do
    [extras: ["README.md"], main: "readme"]
  end

  defp package do
    [maintainers: ["Nikita Sobolev"],
     licenses: ["MIT"],
     links: %{"GitHub" => @url},
     files: ~w(mix.exs README.md lib)]
  end
end
