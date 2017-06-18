use Mix.Config

# Configure Petrovich to use `rules` submodule:
config :petrovich_elixir,
  rules_path: "rules/rules.json",
  gender_path: "rules/gender.json",
  wrong_path: "rules/missing.json"
