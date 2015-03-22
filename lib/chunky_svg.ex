defmodule ChunkySVG do
  def render(content) do
    {:svg, %{viewBox: "0 0 100 100", xmlns: "http://www.w3.org/2000/svg"}, expand(content)} |> XmlBuilder.generate
  end

  defp expand({:hexagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(6, attributes)
  defp expand({:octagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(8, attributes)
  defp expand({:pentagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(5, attributes)

  defp expand(list) when is_list(list) do
    Enum.map(list, &expand/1)
  end

  defp expand(content) do
    content
  end
end
