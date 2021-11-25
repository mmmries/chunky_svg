defmodule Mix.Tasks.GenerateExamples do
  use Mix.Task

  @shortdoc "generates a bunch of sample svgs"

  def run(_argv) do
    examples() |> Enum.each(&generate_example/1)
  end

  defp examples do
    %{
      "circle.svg" => [{:circle, %{cx: 50, cy: 50, r: 40}, nil}],
      "hexagon.svg" => [{:hexagon, %{cx: 50, cy: 50, r: 40}}],
      "pentagon.svg" => [{:pentagon, %{cx: 50, cy: 50, r: 40}}],
      "octagon.svg" => [{:octagon, %{cx: 50, cy: 50, r: 40}}],
    }
  end

  defp generate_example({filename, contents}) do
    svg = ChunkySVG.render(contents)
    File.write!("examples/#{filename}", svg)
  end
end
