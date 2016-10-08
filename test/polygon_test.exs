defmodule PolygonTest do
  use ExUnit.Case

  test "renders a pentagon" do
    rendered = ChunkySVG.render({:pentagon, %{cx: 50, cy: 50, r: 40}})
    starts_with_svg_header(rendered)
    points_close_to(rendered, [50.0, 90.0, 88.0, 62.4, 73.5, 17.6, 26.5, 17.6, 12.0, 62.4])
  end

  test "renders a hexagon" do
    rendered = ChunkySVG.render({:hexagon, %{cx: 50, cy: 50, r: 40}})
    starts_with_svg_header(rendered)
    points_close_to(rendered, [50.0, 90.0, 84.6, 70.0, 84.6, 30.0, 50.0, 10.0, 15.4, 30.0, 15.4, 70.0])
  end

  test "renders an octagon" do
    rendered = ChunkySVG.render({:octagon, %{cx: 50, cy: 50, r: 40}})
    starts_with_svg_header(rendered)
    points_close_to(rendered, [50.0, 90.0, 78.3, 78.3, 90.0, 50.0, 78.3, 21.7, 50, 10.0, 21.7, 21.7, 10.0, 50.0, 21.7, 78.3])
  end

  defp points_close_to(str, reference_numbers) do
    len = String.length(str)
    string_of_numbers = str |> String.slice(81, len - 81 - 10)
    numbers = string_of_numbers |> String.split(" ") |> Enum.map(&String.to_float/1)
    Enum.zip(numbers, reference_numbers) |> Enum.each(fn ({number, reference}) ->
      assert_in_delta number, reference, 0.1
    end)
  end

  def starts_with_svg_header(str) do
    assert String.slice(str, 0,62) == "<svg viewBox=\"0 0 100 100\" xmlns=\"http://www.w3.org/2000/svg\">"
  end
end
