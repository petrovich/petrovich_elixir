defmodule PetrovichTest.ParserTest.FirstName.Normal do
  use ExUnit.Case

  alias Petrovich.Parser

  setup do
    values = %{
      nomenative: [
        {:male, "Никита", "Никита"},
        {:female, "Кира", "Кира"}
      ],

      genitive: [
        {:male, "Никита", "Никиты"},
        {:female, "Кира", "Киры"}
      ],

      dative: [
        {:male, "Никита", "Никите"},
        {:female, "Кира", "Кире"}
      ],

      accusative: [
        {:male, "Никита", "Никиту"},
        {:female, "Кира", "Киру"}
      ],

      instrumental: [
        {:male, "Никита", "Никитой"},
        {:female, "Кира", "Кирой"}
      ],

      prepositional: [
        {:male, "Никита", "Никите"},
        {:female, "Кира", "Кире"}
      ]
    }
    {:ok, values: values}
  end

  test "parses nomenative name", %{values: values} do
    for {gender, name, result} <- values.nomenative do
      assert Parser.parse!(name, :firstname, :nomenative, gender) == result
    end
  end

  test "parses genitive name", %{values: values} do
    for {gender, name, result} <- values.genitive do
      assert Parser.parse!(name, :firstname, :genitive, gender) == result
    end
  end

  test "parses dative name", %{values: values} do
    for {gender, name, result} <- values.dative do
      assert Parser.parse!(name, :firstname, :dative, gender) == result
    end
  end

  test "parses accusative name", %{values: values} do
    for {gender, name, result} <- values.accusative do
      assert Parser.parse!(name, :firstname, :accusative, gender) == result
    end
  end

  test "parses instrumental name", %{values: values} do
    for {gender, name, result} <- values.instrumental do
      assert Parser.parse!(name, :firstname, :instrumental, gender) == result
    end
  end

  test "parses prepositional name", %{values: values} do
    for {gender, name, result} <- values.prepositional do
      assert Parser.parse!(name, :firstname, :prepositional, gender) == result
    end
  end
end


defmodule Petrovich.ParserTest.FirstName.Exception do
  use ExUnit.Case

  alias Petrovich.Parser

  setup do
    values = %{
      nomenative: [
        {:male, "Яша", "Яша"},
        {:female, "Жизель", "Жизель"}
      ],

      genitive: [
        {:male, "Яша", "Яши"},
        {:female, "Жизель", "Жизели"}
      ],

      dative: [
        {:male, "Яша", "Яше"},
        {:female, "Жизель", "Жизели"}
      ],

      accusative: [
        {:male, "Яша", "Яшу"},
        {:female, "Жизель", "Жизель"}
      ],

      instrumental: [
        {:male, "Яша", "Яшей"},
        {:female, "Жизель", "Жизелью"}
      ],

      prepositional: [
        {:male, "Яша", "Яше"},
        {:female, "Жизель", "Жизели"}
      ]
    }
    {:ok, values: values}
  end

  test "parses nomenative name", %{values: values} do
    for {gender, name, result} <- values.nomenative do
      assert Parser.parse!(name, :firstname, :nomenative, gender) == result
    end
  end

  test "parses genitive name", %{values: values} do
    for {gender, name, result} <- values.genitive do
      assert Parser.parse!(name, :firstname, :genitive, gender) == result
    end
  end

  test "parses dative name", %{values: values} do
    for {gender, name, result} <- values.dative do
      assert Parser.parse!(name, :firstname, :dative, gender) == result
    end
  end

  test "parses accusative name", %{values: values} do
    for {gender, name, result} <- values.accusative do
      assert Parser.parse!(name, :firstname, :accusative, gender) == result
    end
  end

  test "parses instrumental name", %{values: values} do
    for {gender, name, result} <- values.instrumental do
      assert Parser.parse!(name, :firstname, :instrumental, gender) == result
    end
  end

  test "parses prepositional name", %{values: values} do
    for {gender, name, result} <- values.prepositional do
      assert Parser.parse!(name, :firstname, :prepositional, gender) == result
    end
  end
end
