defmodule PetrovichElixirTest.GenderStoreTest do
  use ExUnit.Case

  alias PetrovichElixir.GenderStore

  setup do
    {status, _pid} = GenderStore.start_link()

    status
  end

  test "agent has all end values" do
    values = GenderStore.all()
    assert map_size(values) == 1

    values = GenderStore.get("gender")

    for i <- ["firstname", "lastname", "middlename"] do
      assert i in Map.keys(values)
    end
  end

  test "agent get value" do
    value = GenderStore.get("gender", "lastname")
    assert map_size(value) == 2

    for i <- ["exceptions", "suffixes"] do
      assert i in Map.keys(value)
    end
  end

  test "agent starts twice" do
    {second_status, {mod, _pid}} = GenderStore.start_link()

    assert second_status == :error
    assert mod == :already_started
  end
end
