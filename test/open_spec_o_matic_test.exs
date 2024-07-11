defmodule OpenSpecOMaticTest do
  use ExUnit.Case
  doctest OpenSpecOMatic

  test "greets the world" do
    assert OpenSpecOMatic.hello() == :world
  end
end
