defmodule PetrovichTest.Exceptions.ParseExceptionTest do
  use ExUnit.Case

  alias Petrovich.Parser
  alias Petrovich.Exceptions.ParseException

  test "raise ParseException" do
    assert_raise ParseException, fn ->
      Parser.parse!("bad value", :firstname, :prepositional, :male)
    end
  end
end
