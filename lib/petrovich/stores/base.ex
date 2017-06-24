defmodule Petrovich.Store do
  @moduledoc """
  This module implements basic functionality for different agents.

  This module provides a simple macro, when it is used
  it inserts all the required `Agent`'s methods inside the
  caller module.
  """

  alias Petrovich.Config
  alias Petrovich.Exceptions.RulesFileException

  defmacro __using__(options) do
    caller = __CALLER__.module

    quote location: :keep, bind_quoted: [options: options, caller: caller] do
      @setting Keyword.get(options, :setting)

      def start_link do
        Agent.start_link(fn ->
          load_values() end, name: unquote(caller))
      end

      def stop do
        Agent.stop(unquote(caller))
      end

      def get(key) do
        Agent.get(unquote(caller), fn(state) ->
          Map.get(state, key)
        end)
      end

      def all do
        Agent.get(unquote(caller), fn(state) ->
          state
        end)
      end

      defp load_values do
        :petrovich_elixir
        |> Config.get_env(@setting)
        |> File.read!
        |> Poison.decode!
      rescue
        e in File.Error ->
          raise RulesFileException, message: Exception.message(e)
      end
    end
  end
end
