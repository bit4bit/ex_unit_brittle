defmodule ExUnitBrittle.MixProject do
  use Mix.Project

  def project do
    [
      app: :ex_unit_brittle,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [compile: "compile --warnings-as-errors"]
    [test: "test --warnings-as-errors"]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    []
  end

  defp description() do
    "This library is for those annoying tests, full of dust and that no one wants to look at because they are scary."
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "ex_unit_brittle",
      # These are the default files included in the package
      files: ~w(lib priv mix.exs README* readme* LICENSE* license* CHANGELOG* changelog* src),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/bit4bit/ex_unit_brittle"}
    ]
  end
end
