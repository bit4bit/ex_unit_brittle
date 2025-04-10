# ExUnitBrittle

!!DON'T USE THIS, good practices are all you need.
  
`but the reality is impure`

This library is for those annoying tests, full of dust and that no one wants to look at because they are scary.

### Examples

```elixir
defmodule MyTest do
  use ExUnit.Case
  use ExUnitBrittle

  @tag brittle_attemps: 10
  @tag brittle_timeout: 100
  test_brittle "brittle test" do
  ....
  end
end
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `ex_unit_brittle` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:ex_unit_brittle, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/ex_unit_brittle>.

