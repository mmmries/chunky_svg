defmodule ChunkySvg do
  def render(content) do
    {:svg, %{viewBox: "0 0 100 100"}, expand(content)} |> XmlBuilder.generate
  end

  defp expand({:hexagon, attributes}) do
    %{r: r, cx: cx, cy: cy} = attributes
    theta = :math.pi / 3
    angles = [0, theta, 2 * theta, 3 * theta, 4 * theta, 5 * theta]
    points = angles |> Enum.map fn (angle) ->
      [cx + r * :math.sin(angle), cy + r * :math.cos(angle) ]
    end
    points = points |> List.flatten |> Enum.map(&Float.to_string/1) |> Enum.join(" ")
    attributes = attributes |> Dict.drop([:r, :cx, :cy]) |> Dict.put(:points, points)
    {:polygon, attributes, nil}
  end

  defp expand(list) when is_list(list) do
    Enum.map(list, &expand/1)
  end

  defp expand(content) do
    content
  end
end
