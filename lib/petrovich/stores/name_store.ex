defmodule Petrovich.NameStore do
  @moduledoc """
  This module stores different rules on how to inflect values.

  It stores rules for first, middle and last names.
  """

  use Petrovich.Store, setting: :rules_path
end
