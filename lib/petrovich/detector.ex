defmodule Petrovich.Detector do
  @moduledoc """
  Guesses the gender by person's name.
  """

  alias Petrovich.GenderStore
  alias Petrovich.Utils.ResultJoiner

  @doc """
  Detects a gender by name.

  This function receives two arguments:

    1. `name` raw person's name in nomenative case
    2. `type` which shows what part of person's name it is

  You can use any of these values as `type`:

      [:firstname, :middlename, :lastname]

  On success it returns a tuple `{:ok, "detected_gender"}`.
  Or `:error` in cases when it is impossible to detect gender.

  ## Examples

      iex> Detector.detect_gender("Игорь", :firstname)
      {:ok, "male"}

      iex> Detector.detect_gender("Саша", :firstname)
      {:ok, "androgynous"}

      iex> Detector.detect_gender("123", :firstname)
      :error

  """
  @spec detect_gender(String.t, atom()) :: {:ok, String.t} | :error
  def detect_gender(name, type) do
    %{"exceptions" => exceptions,
      "suffixes" => suffixes} = GenderStore.get("gender", to_string(type))

    name
    |> String.downcase
    |> String.split("-")
    |> Enum.map(fn(item) -> prepare_value(item, exceptions, suffixes) end)
    |> ResultJoiner.join_any_results(&join_result/1)
  end

  defp prepare_value(name, exceptions, suffixes) do
    name
    |> maybe_exception(exceptions)
    |> maybe_rule(suffixes)
  end

  defp join_result(result) do
    result
    |> Enum.find(fn (item) ->
      case item do
        {:ok, _} -> true
        _ -> false
      end
    end)
    |> elem(1)
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
      nil -> :error
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
