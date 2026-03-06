defmodule EnumMethods do
  def all?([], _fun), do: true
  def all?([head | []], fun), do: fun.(head)
  def all?([head | tail], fun), do: fun.(head) && all?(tail, fun)

  def any?([], _fun), do: false
  def any?([head | []], fun), do: fun.(head)
  def any?([head | tail], fun), do: fun.(head) || any?(tail, fun)

  def each([[]], _fun), do: []
  def each([head | []], fun), do: [fun.(head)]
  def each([head | tail], fun), do: [fun.(head) | each(tail, fun)]

  def filter([[]], _fun), do: []
  def filter([head | []], fun) do
    if fun.(head) do
      [head]
    else
      []
    end
  end
  def filter([head | tail], fun) do
    if fun.(head) do
      [head | filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end

  #def split([], _), do: []
  #def split([head | []], count) do:
  #def split([head | tail], 0), do: [[head], [tail]]
  #def split([head | tail], count) when count > 0, do: [head | split(tail, count-1)]

  def split(list, n) when n >= 0 , do: split(list, n, [])
  defp split(rest, 0, acc), do: {Enum.reverse(acc), rest}
  defp split([], _n, acc), do: {Enum.reverse(acc), []}
  defp split([h | t], n, acc) when n > 0 do
    split(t, n - 1, [h | acc])
  end

  def take(list, n) when n >= 0, do: take(list, n, [])
  defp take(_rest, 0, acc), do: Enum.reverse(acc)
  defp take([], _n, acc), do: Enum.reverse(acc)
  defp take([h | t], n, acc) when n > 0 do
    take(t, n - 1, [h | acc])
  end

  def flatten(list), do: flatten(list, [])
  defp flatten([], acc), do: Enum.reverse(acc)
  defp flatten([head | tail], acc) when is_list(head), do: flatten(head ++ tail, acc)
  defp flatten([head | tail], acc), do: flatten(tail, [head | acc])
end

defmodule Main do
  def exec() do
    IO.puts(IO.inspect(EnumMethods.flatten([1, [2, 3, [4] ], 5, [[[6]]]])))
  end
end

Main.exec()
