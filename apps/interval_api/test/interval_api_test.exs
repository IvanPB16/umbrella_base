defmodule IntervalApiTest do
  use ExUnit.Case
  doctest IntervalApi

  test "greets the world" do
    assert IntervalApi.hello() == :world
  end
end
