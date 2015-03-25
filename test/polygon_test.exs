defmodule PolygonTest do
  use ExUnit.Case

  test "renders a hexagon" do
    rendered = ChunkySVG.render([{:hexagon, %{cx: 50, cy: 50, r: 40}}])
    refute String.contains?(rendered, "hexagon")
    assert String.contains?(rendered, "polygon")
  end
end
