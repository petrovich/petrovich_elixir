defmodule Petrovich.Parser do
  @moduledoc """
  Parser receives the name and case to infect it to.

  Then it parses the rules to find the appropriate modifications.
  It then calls `Applier` to modify the value.
  """

  alias Petrovich.{NameStore, Applier}
  alias Petrovich.Exceptions.ParseException

  def parse(data, _, :nomenative, _), do: {:ok, data}
  def parse(data, type, case_, gender) do
    apply_rule(data, to_string(type), case_, to_string(gender))
  end

  def parse!(data, type, case_, gender) do
    {status, data} = parse(data, type, case_, gender)

    if status == :ok do
      data
    else
      raise ParseException
    end
  end

  defp apply_rule(values, type, case_, gender) do
    NameStore.start_link()

    values
    |> String.split("-")
    |> Enum.map(fn(item) -> prepare_value(item, type, case_, gender) end)
    |> join_result
  end

  defp prepare_value(value, type, case_, gender) do
    %{"exceptions" => exceptions,
      "suffixes" => suffixes} = NameStore.get(type)

    value
    |> String.downcase
    |> maybe_exception(gender, exceptions)
    |> maybe_rule(gender, suffixes)
    |> case do
      {:error, _} -> {:error, value}
      {:ok, res}  -> {:ok, Applier.apply(value, case_, res)}
    end
  end

  defp join_result(results) do
    success = Enum.all?(results, fn({status, _}) -> status == :ok end)
    joined = results
      |> Enum.map(fn({_, item}) -> item end)
      |> Enum.join("-")

    if success do
      {:ok, joined}
    else
      {:error, joined}
    end
  end

  defp maybe_exception(name, gender, exceptions) do
    exceptions
    |> Enum.filter(fn(item) -> fits?(:e, name, gender, item) end)
    |> pick_one(name)
  end

  defp maybe_rule({:ok, rule}, _, _), do: {:ok, rule}
  defp maybe_rule({:error, name}, gender, suffixes) do
    suffixes
    |> Enum.filter(fn(item) -> fits?(:r, name, gender, item) end)
    |> pick_one(name)
  end

  defp fits?(:e, name, gender, rule) do
    gender?(gender, rule) and name in rule["test"]
  end
  defp fits?(:r, name, gender, rule) do
    name_len = String.length(name)

    gender?(gender, rule) and Enum.any?(rule["test"], fn(test) ->
      test_len = String.length(test)
      test == String.slice(name, name_len - test_len, test_len)
    end)
  end

  defp gender?(gender, rule) do
    gender == rule["gender"] or rule["gender"] == "androgynous"
  end

  defp pick_one(items, name) do
    items
    |> Enum.at(0)
    |> case do
      nil  -> {:error, name}
      rule -> {:ok, rule}
    end
  end
end
