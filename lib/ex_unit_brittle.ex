defmodule ExUnitBrittle do
  @moduledoc """
  Documentation for `ExUnitBrittle`.

  !!DON'T USE THIS, good practices are all you need.

  `but the reality is impure`

  This library is for those annoying tests, full of dust and that no one wants to look at because they are scary.

  ### Examples

  ```
  defmodule MyTest do
    use ExUnit.Case
    use ExUnitBrittle

    @tag brittle_attempts: 10
    @tag brittle_timeout: 100
    test_brittle "brittle test" do
    ....
    end
  end
  ```
  """

  defmacro __using__(_opts) do
    quote do
      import ExUnitBrittle
      ExUnit.Case.register_attribute(__ENV__, :brittle)
    end
  end

  defmacro test_brittle(message, var \\ quote(do: _), contents) do
    context = Macro.escape(var)
    code = Macro.escape(contents, unquote: true)
    %{module: mod, file: file, line: line} = __CALLER__

    quote bind_quoted: [
            code: code,
            context: context,
            message: message,
            mod: mod,
            file: file,
            line: line
          ] do
      name = ExUnit.Case.register_test(mod, file, line, :test, message, [])

      def unquote(name)(
            %{brittle_attempts: brittle_attempts, brittle_timeout: brittle_timeout} =
              context = unquote(context)
          ) do
        unquote(code)
      rescue
        ex ->
          if brittle_attempts > 1 do
            Process.sleep(brittle_timeout)
            unquote(name)(context |> Map.put(:brittle_attempts, brittle_attempts - 1))
          else
            raise ex
          end
      end
    end
  end
end
