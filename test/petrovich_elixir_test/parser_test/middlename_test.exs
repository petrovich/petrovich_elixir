defmodule PetrovichTest.ParserTest.MiddleName.Normal do
  use ExUnit.Case

  alias Petrovich.Parser

  setup do
    values = %{
      nomenative: [
        {:male, "Андреевич", "Андреевич"},
        {:female, "Викторовна", "Викторовна"}
      ],

      genitive: [
        {:male, "Андреевич", "Андреевича"},
        {:female, "Викторовна", "Викторовны"}
      ],

      dative: [
        {:male, "Андреевич", "Андреевичу"},
        {:female, "Викторовна", "Викторовне"}
      ],

      accusative: [
        {:male, "Андреевич", "Андреевича"},
        {:female, "Викторовна", "Викторовну"}
      ],

      instrumental: [
        {:male, "Андреевич", "Андреевичем"},
        {:female, "Викторовна", "Викторовной"}
      ],

      prepositional: [
        {:male, "Андреевич", "Андреевиче"},
        {:female, "Викторовна", "Викторовне"}
      ]
    }
    {:ok, values: values}
  end

  test "parses nomenative name", %{values: values} do
    for {gender, name, result} <- values.nomenative do
      assert Parser.parse(name, :middlename, :nomenative, gender) == result
    end
  end

  test "parses genitive name", %{values: values} do
    for {gender, name, result} <- values.genitive do
      assert Parser.parse(name, :middlename, :genitive, gender) == result
    end
  end

  test "parses dative name", %{values: values} do
    for {gender, name, result} <- values.dative do
      assert Parser.parse(name, :middlename, :dative, gender) == result
    end
  end

  test "parses accusative name", %{values: values} do
    for {gender, name, result} <- values.accusative do
      assert Parser.parse(name, :middlename, :accusative, gender) == result
    end
  end

  test "parses instrumental name", %{values: values} do
    for {gender, name, result} <- values.instrumental do
      assert Parser.parse(name, :middlename, :instrumental, gender) == result
    end
  end

  test "parses prepositional name", %{values: values} do
    for {gender, name, result} <- values.prepositional do
      assert Parser.parse(name, :middlename, :prepositional, gender) == result
    end
  end
end
