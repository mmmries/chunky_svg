defmodule LandscapeTest do
  use ExUnit.Case

  test "renders hills" do
    expected = "<svg viewBox=\"0 0 100 100\" xmlns=\"http://www.w3.org/2000/svg\">\n\t<path d=\"M0,100 Q0.0,80 0,80 25.0,70 50,70 75.0,70 100,80 L100,100 z\"/>\n</svg>"
    assert ChunkySVG.render({:hills, %{points: [{0,80},{50,70},{100,80}]}}) == expected
  end

  test "renders background" do
    expected = "<svg viewBox=\"0 0 100 100\" xmlns=\"http://www.w3.org/2000/svg\">\n\t<rect fill=\"blue\" height=\"100\" width=\"100\" x=\"0\" y=\"0\"/>\n</svg>"
    assert ChunkySVG.render({:background, "blue"}) == expected
  end
end
