defmodule Chop do

  defp guess(value, actual, _) when value == actual, do: IO.puts value
  defp guess(value, actual, lo.._//1) when actual < value, do: guess(actual, lo..(value - 1))
  defp guess(value, actual, _..hi//1) when actual > value, do: guess(actual, (value + 1)..hi)

  defp guessing(lo, hi), do: lo + div(hi - lo, 2)

  def guess(actual, lo..hi//1) when (lo <= hi) and (actual in lo..hi//1) do
    current = guessing(lo, hi)
    IO.puts "Is it #{current}"
    guess(current, actual, lo..hi)
  end



  def span(a, b) when a > b, do: span(b, a) |> Enum.reverse
  def span(a, b) when a == b, do: [a]
  def span(a, b), do: [a | span(a+1, b)]

end

defmodule Employee do
  defstruct firstName: "", lastName: "", age: 30, sex: :male

  def getName(%Employee{firstName: firstName}), do: firstName
end
