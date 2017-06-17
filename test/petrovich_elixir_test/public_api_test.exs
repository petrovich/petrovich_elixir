defmodule PetrovichTest.PublicAPITest do
  use ExUnit.Case

  test "public firstname function works" do
    assert Petrovich.firstname(
      "Александр", :accusative, :male) == "Александра"
  end

  test "public middlename function works" do
    assert Petrovich.middlename(
      "Сергеевич", :accusative, :male) == "Сергеевича"
  end

  test "public lastname function works" do
    assert Petrovich.lastname(
      "Пушкин", :accusative, :male) == "Пушкина"
  end
end
