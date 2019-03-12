defmodule Petrovich do
  @moduledoc """
  Documentation for Petrovich.

  Public interface to all the functions.
  It can inflect first, middle, and last names.

  ## List of cases

  Here's a quick reminder:

  > nomenative: именительный
  >
  > genitive: родительный
  >
  > dative: дательный
  >
  > accusative: винительный
  >
  > instrumental: творительный
  >
  > prepositional: предложный
  """

  use Application

  alias Petrovich.Parser

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Petrovich.NameStore, []),
      worker(Petrovich.GenderStore, [])
    ]

    opts = [strategy: :one_for_one, name: Petrovich.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @default_gender nil

  @doc """
  Inflects first name.

  This function is used to inflect a first name.
  It accepts three arguments:

    1. `name` a person's first name
    2. `case_` atom, one of the atoms with the case name
    3. optional `gender`, since it could be detected from name

  It returns `{:ok, inflected_name}` or `:error`

  ## Examples

      iex> Petrovich.firstname("Кира", :dative)
      {:ok, "Кире"}

  """
  @spec firstname(String.t(), atom(), atom() | none()) ::
          {:ok, String.t()} | :error
  def firstname(name, case_, gender \\ @default_gender) do
    Parser.parse(name, :firstname, case_, gender)
  end

  @doc """
  The same as `firstname/3`, but raises `ParseException` on errors.
  """
  @spec firstname!(String.t(), atom(), atom() | none()) :: String.t()
  def firstname!(name, case_, gender \\ @default_gender) do
    Parser.parse!(name, :firstname, case_, gender)
  end

  @doc """
  Inflects middle name.

  This function is used to inflect a middle name.
  It accepts three arguments:

    1. `name` a person's middle name
    2. `case_` atom, one of the atoms with the case name
    3. optional `gender`, since it could be detected from name

  It returns `{:ok, inflected_name}` or `:error`

  ## Examples

      iex> Petrovich.firstname("Викторовна", :dative)
      {:ok, "Викторовне"}

  """
  @spec middlename(String.t(), atom(), atom() | none()) ::
          {:ok, String.t()} | :error
  def middlename(name, case_, gender \\ @default_gender) do
    Parser.parse(name, :middlename, case_, gender)
  end

  @doc """
  The same as `middlename/3`, but raises `ParseException` on errors.
  """
  @spec middlename!(String.t(), atom(), atom() | none()) :: String.t()
  def middlename!(name, case_, gender \\ @default_gender) do
    Parser.parse!(name, :middlename, case_, gender)
  end

  @doc """
  Inflects last name.

  This function is used to inflect a last name.
  It accepts three arguments:

    1. `name` a person's last name
    2. `case_` atom, one of the atoms with the case name
    3. optional `gender`, since it could be detected from name

  It returns `{:ok, inflected_name}` or `:error`

  ## Examples

      iex> Petrovich.firstname("Горева", :dative)
      {:ok, "Гореве"}

  """
  @spec lastname(String.t(), atom(), atom() | none()) ::
          {:ok, String.t()} | :error
  def lastname(name, case_, gender \\ @default_gender) do
    Parser.parse(name, :lastname, case_, gender)
  end

  @doc """
  The same as `lastname/3`, but raises `ParseException` on errors.
  """
  @spec lastname!(String.t(), atom(), atom() | none()) :: String.t()
  def lastname!(name, case_, gender \\ @default_gender) do
    Parser.parse!(name, :lastname, case_, gender)
  end
end
