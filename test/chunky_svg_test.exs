defmodule ChunkySVGTest do
  use ExUnit.Case

  test "renders low-level objects as straight xml" do
    expected = "<svg viewBox=\"0 0 100 100\" xmlns=\"http://www.w3.org/2000/svg\">\n  <circle cx=\"50\" cy=\"50\" r=\"40\"/>\n</svg>"
    assert ChunkySVG.render([{:circle, %{cx: 50, cy: 50, r: 40}, nil}]) == expected
  end

  test "accepts a single tuple in place of a list" do
    expected = "<svg viewBox=\"0 0 100 100\" xmlns=\"http://www.w3.org/2000/svg\">\n  <circle cx=\"50\" cy=\"50\" r=\"40\"/>\n</svg>"
    assert ChunkySVG.render({:circle, %{cx: 50, cy: 50, r: 40}, nil}) == expected
  end
end
