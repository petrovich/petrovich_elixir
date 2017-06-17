defmodule PetrovichElixir.Petrovich do
  @moduledoc """
  Public interface to all the functions.

  It can inflect first, middle, and last names.
  It also can detect gender by name.
  """

  alias PetrovichElixir.Parser

  @default_gender :androgynous

  def firstname(name, case_, gender \\ @default_gender) do
    Parser.parse(name, :firstname, case_, gender)
  end

  def middlename(name, case_, gender \\ @default_gender) do
    Parser.parse(name, :middlename, case_, gender)
  end

  def lastname(name, case_, gender \\ @default_gender) do
    Parser.parse(name, :lastname, case_, gender)
  end
end