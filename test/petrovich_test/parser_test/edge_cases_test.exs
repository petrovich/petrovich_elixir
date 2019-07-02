defmodule PetrovichTest.ParserTest.Edge do
  use ExUnit.Case

  alias Petrovich.Parser

  test "should fail on wrong names with '-'" do
    assert Parser.parse(
             "Никита-123",
             :firstname,
             :prepositional,
             :male
           ) == :error
  end
end
