defmodule ChunkySVG.Hills do
  def expand(attributes) do
    %{points: points} = attributes
    bez_points = [{0,100} | points] |> ChunkySVG.Cons.each_cons |> Enum.map(fn([{x1,y1},{x2,y2}]) ->
      [{x1 + ((x2-x1)/2), Enum.min([y1,y2])},{x2,y2}]
    end)
    bez_points = bez_points |> List.flatten |> Enum.map(fn ({x,y}) -> "#{x},#{y}" end)
    bez_points = bez_points |> Enum.join(" ")
    path_spec = "M0,100 Q#{bez_points} L100,100 z"
    attributes = attributes |> Map.drop([:points]) |> Map.put(:d, path_spec)
    {:path, attributes, nil}
  end
end
