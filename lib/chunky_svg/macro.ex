defmodule ChunkySVG.Macro do
  def expand(drawing) do
    inline_macros = extract_macros(drawing)
    drawing |> inline(inline_macros) |> builtin
  end

  defp builtin({:triangle, attributes}), do: ChunkySVG.Polygon.render_n_sided(3, attributes)
  defp builtin({:hexagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(6, attributes)
  defp builtin({:octagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(8, attributes)
  defp builtin({:pentagon, attributes}), do: ChunkySVG.Polygon.render_n_sided(5, attributes)
  defp builtin({:background, color}), do: {:rect, %{x: 0, y: 0, height: 100, width: 100, fill: color}, nil}
  defp builtin({:hills, attributes}), do: ChunkySVG.Hills.expand(attributes)
  defp builtin(list) when is_list(list) do
    Enum.map(list, &builtin/1)
  end
  defp builtin(drawing), do: drawing # Pass Through Rule

  defp extract_macros({:def, label, shape}), do: [{label, shape}]
  defp extract_macros(drawing) when is_list(drawing) do
    Enum.map(drawing, &extract_macros/1) |> List.flatten
  end
  defp extract_macros(_), do: []

  defp inline(drawing, macros) when is_list(drawing) do
    Enum.map(drawing, &(inline(&1,macros))) |> Enum.filter(&(&1))
  end
  defp inline({:def, _label, _shape}, _macros), do: nil
  defp inline({label}, macros) do
    case macros[label] do
      nil -> {label}
      {mlabel, mattributes, mcontents} ->
        expanded_contents = inline(mcontents, macros)
        {mlabel, mattributes, expanded_contents}
    end
  end
  defp inline({label, attributes}, macros) do
    case macros[label] do
      nil -> {label, attributes}
      {mlabel, mattributes, mcontents} ->
        merged_attributes = Dict.merge(mattributes, attributes)
        expanded_contents = inline(mcontents, macros)
        {mlabel, merged_attributes, expanded_contents}
    end
  end
  defp inline(drawing, _macros), do: drawing
end
