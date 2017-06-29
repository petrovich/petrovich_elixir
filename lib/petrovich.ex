defmodule Petrovich do
  @moduledoc """
  Documentation for Petrovich.

  Public interface to all the functions.
  It can inflect first, middle, and last names.
  It also can detect gender by name.
  """

  use Application

  alias Petrovich.Parser

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children =
      [
        worker(Petrovich.NameStore, []),
        worker(Petrovich.GenderStore, []),
      ]

    opts = [strategy: :one_for_one, name: Petrovich.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @default_gender nil

  @spec firstname(String.t, atom(), atom() | none()) :: {atom(), String.t}
  def firstname(name, case_, gender \\ @default_gender) do
    Parser.parse(name, :firstname, case_, gender)
  end

  @spec firstname!(String.t, atom(), atom() | none()) :: String.t
  def firstname!(name, case_, gender \\ @default_gender) do
    Parser.parse!(name, :firstname, case_, gender)
  end

  @spec middlename(String.t, atom(), atom() | none()) :: {atom(), String.t}
  def middlename(name, case_, gender \\ @default_gender) do
    Parser.parse(name, :middlename, case_, gender)
  end

  @spec middlename!(String.t, atom(), atom() | none()) :: String.t
  def middlename!(name, case_, gender \\ @default_gender) do
    Parser.parse!(name, :middlename, case_, gender)
  end

  @spec lastname(String.t, atom(), atom() | none()) :: {atom(), String.t}
  def lastname(name, case_, gender \\ @default_gender) do
    Parser.parse(name, :lastname, case_, gender)
  end

  @spec lastname!(String.t, atom(), atom() | none()) :: String.t
  def lastname!(name, case_, gender \\ @default_gender) do
    Parser.parse!(name, :lastname, case_, gender)
  end
end
