defmodule ChunkySVGTest do
  use ExUnit.Case

  test "renders low-level objects as straight xml" do
    expected = "<svg viewBox=\"0 0 100 100\">\n\t<circle cx=\"50\" cy=\"50\" r=\"40\"/>\n</svg>"
    assert ChunkySVG.render([{:circle, %{cx: 50, cy: 50, r: 40}, nil}]) == expected
  end

  test "renders a hexagon" do
    rendered = ChunkySVG.render([{:hexagon, %{cx: 50, cy: 50, r: 40}}])
    refute String.contains?(rendered, "hexagon")
    assert String.contains?(rendered, "polygon")
  end
end
