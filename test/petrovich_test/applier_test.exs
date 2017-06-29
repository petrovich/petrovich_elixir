defmodule PetrovichTest.ApplierTest do
  use ExUnit.Case

  alias Petrovich.Applier

  setup do
    # Just some fake modifications:
    values = %{"mods" => [
      "--1", # genitive
      "-2",  # dative
      "3",   # accusative
      "44",  # instrumental
      "."    # prepositional
    ]}
    {:ok, rules: values}
  end

  test "applies modifications to the value", %{rules: rules} do
    assert Applier.apply("123", :genitive, rules) == "11"
    assert Applier.apply("123", :dative, rules) == "122"
    assert Applier.apply("123", :accusative, rules) == "1233"
    assert Applier.apply("123", :instrumental, rules) == "12344"
    assert Applier.apply("123", :prepositional, rules) == "123"
  end
end
