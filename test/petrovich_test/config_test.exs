defmodule PetrovichTest.ConfigTest do
  use ExUnit.Case

  alias Petrovich.Config

  test "config can read regular config values" do
    Application.put_env(:petrovich_elixir, :test_var, "test")

    assert Config.get_env(:petrovich_elixir, :test_var) == "test"
  end

  test "config can read environment variables" do
    System.put_env("TEST_VAR", "test_env_vars")
    Application.put_env(
      :petrovich_elixir,
      :test_env_var,
      {:system, "TEST_VAR"})

    assert Config.get_env(
      :petrovich_elixir, :test_env_var) == "test_env_vars"
  end
end
