defmodule PetrovichElixirTest.StoreTest do
  use ExUnit.Case

  alias PetrovichElixir.Store

  setup do
    {status, _pid} = Store.start_link()

    status
  end

  test "agent has all end values" do
    values = Store.all()
    assert map_size(values) == 3

    for i <- ["firstname", "lastname", "middlename"] do
      assert i in Map.keys(values)
    end
  end

  test "agent get value" do
    value = Store.get("lastname")
    assert map_size(value) == 2

    for i <- ["exceptions", "suffixes"] do
      assert i in Map.keys(value)
    end
  end

  # test "finds value" do
  #   name = "Никита"
  #   len = String.length(name)

  #   first_names = Store.get("firstname")
  #   for rule <- first_names["suffixes"] do
  #     for test <- rule["test"] do
  #       l = String.length(test)
  #       fits = String.slice(name, len - l, l)
  #       IO.inspect([test, fits])
  #     end
  #   end

  #   assert false
  # end
end
