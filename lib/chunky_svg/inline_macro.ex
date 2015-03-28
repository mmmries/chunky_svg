defmodule ChunkySVG.InlineMacro do
  def expand(drawing) do
    macros = extract_macros(drawing)
    inline(drawing, macros)
  end

  defp extract_macros({:def, label, shape}), do: [{label, shape}]
  defp extract_macros(drawing) when is_list(drawing) do
    Enum.map(drawing, &extract_macros/1) |> List.flatten
  end
  defp extract_macros(_), do: []

  defp inline(drawing, macros) when is_list(drawing) do
    Enum.map(drawing, &(inline(&1,macros))) |> Enum.filter(&(&1))
  end
  defp inline({:def, _label, _shape}, macros), do: nil
  defp inline({label}, macros) do
    case macros[label] do
      nil -> {label}
      shape -> shape
    end
  end
  defp inline({label, attributes}, macros) do
    case macros[label] do
      nil -> {label, attributes}
      {mlabel, mattributes, mcontents} ->
        merged_attributes = Dict.merge(mattributes, attributes)
        {mlabel, merged_attributes, mcontents}
    end
  end
  defp inline(drawing, _macros), do: drawing
end
