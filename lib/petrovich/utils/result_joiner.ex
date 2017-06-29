defmodule Petrovich.Utils.ResultJoiner do
  @moduledoc false

  def join_all_results(results, callback) do
    do_join(results, callback, &Enum.all?/2)
  end

  def join_any_results(results, callback) do
    do_join(results, callback, &Enum.any?/2)
  end

  defp do_join(results, callback, check) do
    success = check.(results, &compare_status/1)

    if success do
      {:ok, callback.(results)}
    else
      :error
    end
  end

  defp compare_status({:ok, _}), do: true
  defp compare_status(_), do: false
end
