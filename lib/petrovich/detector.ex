defmodule Petrovich.Detector do
  @moduledoc """
  Guesses the gender by person's name.
  """

  alias Petrovich.GenderStore

  @doc """
  Returns gender from person's name
  """
  def detect_gender(value, type) do
    GenderStore.start_link()

    %{"exceptions" => exceptions,
      "suffixes" => suffixes} = GenderStore.get("gender", to_string(type))

    value
    |> String.downcase
    |> maybe_exception(exceptions)
    |> maybe_rule(suffixes)
  end

  defp maybe_exception(name, exceptions) do
    exceptions
    |> Enum.find(fn({_, names}) -> name in names end)
    |> case do
      {gender, _} -> {:ok, gender}
      nil -> {:error, name}
    end
  end

  defp maybe_rule({:ok, gender}, _), do: {:ok, gender}
  defp maybe_rule({:error, name}, suffixes) do
    suffixes
    |> Enum.find(fn({_, rule}) -> fits?(name, rule) end)
    |> case do
      {gender, _} -> {:ok, gender}
      nil -> {:error, name}
    end
  end

  defp fits?(name, rule) do
    name_len = String.length(name)

    Enum.any?(rule, fn(test) ->
      test_len = String.length(test)
      test == String.slice(name, name_len - test_len, test_len)
    end)
  end

end
