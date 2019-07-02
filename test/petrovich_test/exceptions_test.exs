defmodule PetrovichTest.Exceptions.ParseExceptionTest do
  use ExUnit.Case

  alias Petrovich.Exceptions.ParseException
  alias Petrovich.Parser

  test "raise ParseException" do
    assert_raise ParseException, fn ->
      Parser.parse!("bad value", :firstname, :prepositional, :male)
    end
  end
end
