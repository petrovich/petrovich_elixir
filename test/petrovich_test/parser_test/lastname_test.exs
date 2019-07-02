defmodule PetrovichTest.ParserTest.LastName.Normal do
  use ExUnit.Case

  alias Petrovich.Parser

  setup do
    values = %{
      nomenative: [
        {:male, "Соболев", "Соболев"},
        {:female, "Горева", "Горева"}
      ],
      genitive: [
        {:male, "Соболев", "Соболева"},
        {:female, "Горева", "Горевой"}
      ],
      dative: [
        {:male, "Соболев", "Соболеву"},
        {:female, "Горева", "Горевой"}
      ],
      accusative: [
        {:male, "Соболев", "Соболева"},
        {:female, "Горева", "Гореву"}
      ],
      instrumental: [
        {:male, "Соболев", "Соболевым"},
        {:female, "Горева", "Горевой"}
      ],
      prepositional: [
        {:male, "Соболев", "Соболеве"},
        {:female, "Горева", "Горевой"}
      ]
    }

    {:ok, values: values}
  end

  test "parses nomenative name", %{values: values} do
    for {gender, name, result} <- values.nomenative do
      assert Parser.parse!(name, :lastname, :nomenative, gender) == result
    end
  end

  test "parses genitive name", %{values: values} do
    for {gender, name, result} <- values.genitive do
      assert Parser.parse!(name, :lastname, :genitive, gender) == result
    end
  end

  test "parses dative name", %{values: values} do
    for {gender, name, result} <- values.dative do
      assert Parser.parse!(name, :lastname, :dative, gender) == result
    end
  end

  test "parses accusative name", %{values: values} do
    for {gender, name, result} <- values.accusative do
      assert Parser.parse!(name, :lastname, :accusative, gender) == result
    end
  end

  test "parses instrumental name", %{values: values} do
    for {gender, name, result} <- values.instrumental do
      assert Parser.parse!(name, :lastname, :instrumental, gender) == result
    end
  end

  test "parses prepositional name", %{values: values} do
    for {gender, name, result} <- values.prepositional do
      assert Parser.parse!(name, :lastname, :prepositional, gender) == result
    end
  end
end

defmodule PetrovichTest.ParserTest.LastName.Multipart do
  use ExUnit.Case

  alias Petrovich.Parser

  setup do
    values = %{
      nomenative: [
        {:male, "Соболев-Водкин", "Соболев-Водкин"}
      ],
      genitive: [
        {:male, "Соболев-Водкин", "Соболева-Водкина"}
      ],
      dative: [
        {:male, "Соболев-Водкин", "Соболеву-Водкину"}
      ],
      accusative: [
        {:male, "Соболев-Водкин", "Соболева-Водкина"}
      ],
      instrumental: [
        {:male, "Соболев-Водкин", "Соболевым-Водкиным"}
      ],
      prepositional: [
        {:male, "Соболев-Водкин", "Соболеве-Водкине"}
      ]
    }

    {:ok, values: values}
  end

  test "parses nomenative name", %{values: values} do
    for {gender, name, result} <- values.nomenative do
      assert Parser.parse!(name, :lastname, :nomenative, gender) == result
    end
  end

  test "parses genitive name", %{values: values} do
    for {gender, name, result} <- values.genitive do
      assert Parser.parse!(name, :lastname, :genitive, gender) == result
    end
  end

  test "parses dative name", %{values: values} do
    for {gender, name, result} <- values.dative do
      assert Parser.parse!(name, :lastname, :dative, gender) == result
    end
  end

  test "parses accusative name", %{values: values} do
    for {gender, name, result} <- values.accusative do
      assert Parser.parse!(name, :lastname, :accusative, gender) == result
    end
  end

  test "parses instrumental name", %{values: values} do
    for {gender, name, result} <- values.instrumental do
      assert Parser.parse!(name, :lastname, :instrumental, gender) == result
    end
  end

  test "parses prepositional name", %{values: values} do
    for {gender, name, result} <- values.prepositional do
      assert Parser.parse!(name, :lastname, :prepositional, gender) == result
    end
  end
end
