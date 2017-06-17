defmodule PetrovichElixirTest.NameStoreTest do
  use ExUnit.Case

  alias PetrovichElixir.NameStore

  setup do
    {status, _pid} = NameStore.start_link()

    status
  end

  test "agent has all end values" do
    values = NameStore.all()
    assert map_size(values) == 3

    for i <- ["firstname", "lastname", "middlename"] do
      assert i in Map.keys(values)
    end
  end

  test "agent get value" do
    value = NameStore.get("lastname")
    assert map_size(value) == 2

    for i <- ["exceptions", "suffixes"] do
      assert i in Map.keys(value)
    end
  end

  test "agent starts twice" do
    {second_status, {mod, _pid}} = NameStore.start_link()

    assert second_status == :error
    assert mod == :already_started
  end
end
