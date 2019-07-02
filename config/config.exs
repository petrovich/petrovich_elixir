# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

# We only use config for tests and development:
if Mix.env() == :test, do: import_config("test.exs")
if Mix.env() == :dev, do: import_config("dev.exs")
