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

  test "can recursively inline macro" do
    drawing = [
      {:def, :box, {:rect, %{x: 0, y: 0, height: 10, width: 10}, nil}},
      {:def, :box2, {:rect, %{x: 1, y: 1, height: 4, width: 10}, [
        {:box, %{transform: "rotate(45, 3, 3)"}}
      ]}},
      {:box, %{transform: "rotate(45, 5, 5)"}},
      {:box2, %{fill: "red"}}
    ]

    assert expand(drawing) == [
      {:rect, %{height: 10, transform: "rotate(45, 5, 5)", width: 10, x: 0, y: 0}, nil},
      {:rect, %{height: 4, width: 10, x: 1, y: 1, fill: "red"}, [
        {:rect, %{height: 10, transform: "rotate(45, 3, 3)", width: 10, x: 0, y: 0}, nil},
      ]}
    ]
  end
end
