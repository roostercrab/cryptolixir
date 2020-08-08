defmodule CryptolixirTest do
  use ExUnit.Case
  doctest Cryptolixir

  test "greets the world" do
    assert Cryptolixir.hello() == :world
  end
end
