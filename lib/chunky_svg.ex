defmodule ChunkySVG do
  def render(drawing) when is_tuple(drawing) do
    render([drawing])
  end

  def render(drawing) when is_list(drawing) do
    drawing = drawing |> ChunkySVG.Macro.expand
    {:svg, %{viewBox: "0 0 100 100", xmlns: "http://www.w3.org/2000/svg"}, drawing} |> XmlBuilder.generate
  end
end
