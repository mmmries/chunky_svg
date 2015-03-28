defmodule InlineMacrosTest do
  use ExUnit.Case
  import ChunkySVG.Macro

  test "expands simple macros defined in the drawing" do
    drawing = [
      {:def, :box, {:rect, %{x: 0, y: 0, height: 10, width: 10}, nil}},
      {:box},
    ]
    assert expand(drawing) == [{:rect, %{x: 0, y: 0, height: 10, width: 10}, nil}]
  end

  test "expands inline macros with merged attributes" do
    drawing = [
      {:def, :box, {:rect, %{x: 0, y: 0, height: 10, width: 10}, nil}},
      {:box, %{transform: "rotate(45, 5, 5)"}},
    ]
    assert expand(drawing) == [{:rect, %{x: 0, y: 0, height: 10, width: 10, transform: "rotate(45, 5, 5)"}, nil}]
  end
end
