defmodule Petrovich.Utils.ResultJoiner do
  @moduledoc false

  def join_result(results, callback) do
    success = Enum.any?(results, &compare_status/1)

    if success do
      {:ok, callback.(results)}
    else
      :error
    end
  end

  defp compare_status({:ok, _}), do: true
  defp compare_status(_), do: false
end
