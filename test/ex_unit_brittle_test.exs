defmodule ExUnitBrittleTest do
  use ExUnit.Case, async: false
  use ExUnitBrittle

  @moduletag fixtures: [false, false, true]
  @moduletag brittle_attempts: 10
  @moduletag brittle_timeout: 100

  test_brittle "pass", %{fixtures: fixtures} do
    fixture_at = Process.get(:fixture_at, 0)
    fixture = Enum.at(fixtures, fixture_at)
    Process.put(:fixture_at, fixture_at + 1)
    assert true == fixture
  end

  describe "nested" do
    test_brittle "pass", %{fixtures: fixtures} do
      fixture_at = Process.get(:fixture_at, 0)
      fixture = Enum.at(fixtures, fixture_at)
      Process.put(:fixture_at, fixture_at + 1)
      assert true == fixture
    end
  end
end
