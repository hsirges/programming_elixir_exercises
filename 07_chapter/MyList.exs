defmodule MyList do
  def span(from, to) when from <= to, do: span(from, to, [])
  defp span(from, to, acc) when from <= to, do: span(from, to-1, [to | acc])
  defp span(from, to, acc) when from > to, do: acc
end

IO.inspect(MyList.span(1, 100))
