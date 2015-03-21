defmodule ChunkySvgTest do
  use ExUnit.Case

  test "renders low-level objects as straight xml" do
    expected = "<svg viewBox=\"0 0 100 100\">\n\t<circle cx=\"50\" cy=\"50\" r=\"40\"/>\n</svg>"
    assert ChunkySvg.render([{:circle, %{cx: 50, cy: 50, r: 40}, nil}]) == expected
  end

  test "renders a hexagon" do
    rendered = ChunkySvg.render([{:hexagon, %{cx: 50, cy: 50, r: 40}}])
    refute String.contains?(rendered, "hexagon")
    assert String.contains?(rendered, "polygon")
  end
end
