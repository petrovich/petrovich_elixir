defmodule PetrovichTest.DetectorTest do
  use ExUnit.Case

  alias Petrovich.Detector

  doctest Detector

  test "detects exception genders" do
    assert Detector.detect_gender("Никита", :firstname) == {:ok, "male"}
    assert Detector.detect_gender("Женя", :firstname) == {:ok, "androgynous"}
    assert Detector.detect_gender("Наташа", :firstname) == {:ok, "female"}
  end

  test "detects correct gender" do
    assert Detector.detect_gender("Айгуль", :firstname) == {:ok, "female"}
    assert Detector.detect_gender("Ибрагим", :firstname) == {:ok, "male"}
  end

  test "detects androgynous names" do
    assert Detector.detect_gender("Саша", :firstname) == {:ok, "androgynous"}
  end

  test "fails to detect gender" do
    assert Detector.detect_gender("123", :lastname) == :error
  end
end
