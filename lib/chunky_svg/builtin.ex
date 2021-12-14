defmodule ChunkySVG.Builtin do
  def expand({:triangle, attributes}), do: ChunkySVG.Polygon.render_n_sided(3, attributes)
  def expand({:square, attributes}), do: ChunkySVG.Polygon.render_n_sided(4, attributes)
  def expand({:hexagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(6, attributes)
  def expand({:octagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(8, attributes)
  def expand({:pentagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(5, attributes)

  def expand({:background, color}),
    do: {:rect, %{x: 0, y: 0, height: 100, width: 100, fill: color}, nil}

  def expand({:hills, attributes}), do: ChunkySVG.Hills.expand(attributes)
  def expand({type, attributes, content}), do: {type, attributes, expand(content)}

  def expand(list) when is_list(list) do
    Enum.map(list, &expand/1)
  end

  # Pass Through Rule
  def expand(drawing), do: drawing
end
