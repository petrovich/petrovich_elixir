# petrovic_elixir

[![petrovich](https://camo.githubusercontent.com/4555ec1b7aa15e0cd22f8ff619c965da0596399a/68747470733a2f2f7261772e6769746875622e636f6d2f726f637363692f706574726f766963682f6d61737465722f706574726f766963682e706e67)](https://github.com/petrovich/petrovich_elixir)

[![Build Status](https://travis-ci.org/petrovich/petrovich_elixir.svg?branch=master)](https://travis-ci.org/petrovich/petrovich_elixir) [![Coverage Status](https://coveralls.io/repos/github/petrovich/petrovich_elixir/badge.svg?branch=master)](https://coveralls.io/github/petrovich/petrovich_elixir?branch=master) [![Hex Version](https://img.shields.io/hexpm/v/petrovich_elixir.svg)](https://hex.pm/packages/petrovich_elixir) [![License](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

Elixir library to inflect Russian first, last, and middle names.


## Installation

The package can be installed
by adding `petrovich_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:petrovich_elixir, "~> 0.1.0"}]
end
```


## Usage

### Do I need to know russian to use it?

Yes, you will need some basic russian knowledge to work with this library.
You need to understand how [grammatical cases](https://en.wikipedia.org/wiki/Grammatical_case) work in russian language.

### API

```elixir
Petrovich.firstname("Александр", :accusative, :male)
# => Александра

Petrovich.middlename("Сергеевич", :accusative, :male)
# => Сергеевича

Petrovich.lastname("Пушкин", :accusative, :male)
# => Пушкина
```


## Configuration

You will need to add these lines into your `config.exs`:

```elixir
config :petrovich_elixir,
  rules_path: "rules/rules.json",
  gender_path: "rules/gender.json"
```


## Rules

This package uses [`petrovich-rules`](https://github.com/petrovich/petrovich-rules) as the source for all transformations. If you ever experience wrong result or other issues with the data itself, please open an issue [here](https://github.com/petrovich/petrovich-rules/issues).


## License

MIT. See [LICENSE](/LICENSE) for details.

