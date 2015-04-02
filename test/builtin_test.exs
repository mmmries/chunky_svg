defmodule BuiltinTest do
  use ExUnit.Case

  test "it expands builtins that are inside of an inline maro definition" do
    drawing = [
      {:def, :tri, {:g, %{}, [
        {:triangle, %{cx: 50, cy: 50, r: 5}},
      ]}},
      {:tri},
    ]
    assert [{:def, :tri, {:g, %{}, [{:polygon,_attrs, nil}]}},{:tri}] = ChunkySVG.Builtin.expand(drawing)
  end
end
