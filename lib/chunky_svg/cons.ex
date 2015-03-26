defmodule ChunkySVG.Cons do

  def each_cons(list, n \\ 2), do: _each_cons(list, n, [])

  defp _each_cons(list,  n, result) when length(list) < n do
    Enum.reverse result
  end

  defp _each_cons(list = [_ | tail], n, result) do
    _each_cons(tail, n, [Enum.take(list, n)|result])
  end
end
