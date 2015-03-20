defmodule ChunkySvgTest do
  use ExUnit.Case

  test "generates a circle" do
    expected = "<svg>\n\t<circle cx=\"50\" cy=\"50\" r=\"40\"/>\n</svg>"
    assert ChunkySvg.render({:circle, {50,50}, 40}) == expected
  end
end
