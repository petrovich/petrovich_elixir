defmodule PetrovichTest.PoisonTest do
  use ExUnit.Case

  setup do
    Mix.Config.eval!("config/test_poison.exs")
    :ok
  end

  test "public firstname function works" do
    assert Petrovich.firstname("Александр", :accusative, :male) ==
             {:ok, "Александра"}
  end
end
