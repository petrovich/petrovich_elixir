defmodule Petrovich.Exceptions.ParseException do
  @moduledoc """
  This exception is used when it is impossible for some reason
  to parse and inflect a person's name.
  """
  defexception message: "Name is not parsed"
end

defmodule Petrovich.Exceptions.RulesFileException do
  @moduledoc """
  This exception is raised when wrong setting
  with wrong path for a `Store` is supplied.
  """
  defexception message: "Rules file is missing"
end
