defmodule PetrovichTest.PublicAPITest do
  use ExUnit.Case

  doctest Petrovich

  test "public firstname function works" do
    assert Petrovich.firstname(
      "Александр", :accusative, :male) == {:ok, "Александра"}
  end

  test "public middlename function works" do
    assert Petrovich.middlename(
      "Сергеевич", :accusative, :male) == {:ok, "Сергеевича"}
  end

  test "public lastname function works" do
    assert Petrovich.lastname(
      "Пушкин", :accusative, :male) == {:ok, "Пушкина"}
  end

  test "public firstname! function works" do
    assert Petrovich.firstname!(
      "Александр", :accusative, :male) == "Александра"
  end

  test "public middlename! function works" do
    assert Petrovich.middlename!(
      "Сергеевич", :accusative, :male) == "Сергеевича"
  end

  test "public lastname! function works" do
    assert Petrovich.lastname!(
      "Пушкин", :accusative, :male) == "Пушкина"
  end
end
