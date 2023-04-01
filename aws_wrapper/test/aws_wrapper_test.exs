defmodule AwsWrapperTest do
  use ExUnit.Case
  doctest AwsWrapper

  test "greets the world" do
    assert AwsWrapper.hello() == :world
  end
end
