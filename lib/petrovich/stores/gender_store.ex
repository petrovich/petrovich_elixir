defmodule Petrovich.GenderStore do
  @moduledoc """
  This module stores different genders.

  It is then used to guess the gender by name,
  last name or middle name.
  """

  use Petrovich.Store, setting: :gender_path

  @name __MODULE__

  def get(key1, key2) do
    Agent.get(@name, fn state ->
      state
      |> Map.get(key1)
      |> Map.get(key2)
    end)
  end
end
