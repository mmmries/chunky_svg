defmodule ChunkySvg do
  def render({:circle, center, radius}) do
    {cx, cy} = center
    {:svg, nil, [
      {:circle, %{cx: cx, cy: cy, r: radius}, nil}]} |> XmlBuilder.generate
  end
end
