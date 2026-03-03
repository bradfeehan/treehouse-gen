defmodule TreehouseGenTest do
  use ExUnit.Case, async: true

  test "hello/0 returns world" do
    assert TreehouseGen.hello() == :world
  end
end
