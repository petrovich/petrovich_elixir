defmodule Petrovich.Applier do
  @moduledoc """
  Applies rules on value.

  This module applies inflection rules on raw values.
  It is tightly coupled with `Parser`, which supplies the rules.

  This function should not be used directly. Use `Petrovich` module instead.
  """

  @rules %{
    genitive: 0,
    dative: 1,
    accusative: 2,
    instrumental: 3,
    prepositional: 4,
  }

  @doc """
  This function applies one of the rule based on case to the name,
  making the inflection itself.

  These rules should be in format: `%{"mods" => list(5)}`.
  """
  @spec apply(String.t, atom(), map()) :: {atom(), String.t}
  def apply(data, case_, %{"mods" => mods}) do
    mod = Enum.at(mods, @rules[case_])
    apply_mod(mod, data)
  end

  defp apply_mod(".", data), do: data
  defp apply_mod(mod, data) do
    case count_replaces(mod) do
      0 -> data <> mod
      _ -> replace(mod, data)
    end
  end

  defp replace(mod, data) do
    replaces = count_replaces(mod)
    length = String.length(data)

    root = String.slice(data, 0, length - replaces)
    root <> String.replace(mod, "-", "")
  end

  defp count_replaces(mod) do
    mod
    |> String.graphemes
    |> Enum.reduce(%{}, fn(letter, acc) ->
      Map.update(acc, letter, 1, &(&1 + 1))
    end)
    |> Map.get("-", 0)
  end
end
