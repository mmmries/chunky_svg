defmodule ChunkySVG.Polygon do
  def render_n_sided(n, attributes) when n > 2 do
    %{r: r, cx: cx, cy: cy} = attributes
    theta = 2 * :math.pi() / n
    angles = 0..(n - 1) |> Enum.map(fn n -> theta * n end)

    points =
      angles
      |> Enum.map(fn angle ->
        [cx + r * :math.sin(angle), cy + r * :math.cos(angle)]
      end)

    points = points |> List.flatten() |> Enum.map(&Float.to_string/1) |> Enum.join(" ")
    attributes = attributes |> Map.drop([:r, :cx, :cy]) |> Map.put(:points, points)
    {:polygon, attributes, nil}
  end
end
