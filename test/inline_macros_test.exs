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
end
