defmodule ChunkySVG do
  def render(content) when is_tuple(content) do
    render([content])
  end

  def render(content) when is_list(content) do
    {:svg, %{viewBox: "0 0 100 100", xmlns: "http://www.w3.org/2000/svg"}, expand(content)} |> XmlBuilder.generate
  end

  defp expand({:hexagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(6, attributes)
  defp expand({:octagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(8, attributes)
  defp expand({:pentagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(5, attributes)

  defp expand({:background, color}), do: {:rect, %{x: 0, y: 0, height: 100, width: 100, fill: color}, nil}
  defp expand({:hills, attributes}), do: ChunkySVG.Hills.expand(attributes)

  defp expand(list) when is_list(list) do
    Enum.map(list, &expand/1)
  end

  defp expand(content) do
    content
  end
end
