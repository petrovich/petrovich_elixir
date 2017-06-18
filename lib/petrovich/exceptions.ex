defmodule Petrovich.Exceptions.ParseException do
  defexception message: "Name is not parsed"
end

defmodule Petrovich.Exceptions.RulesFileException do
  defexception message: "Rules file is missing"
end
