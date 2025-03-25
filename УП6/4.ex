defmodule DivisorProduct do
  def product(a, b, k) do
    a..b
    |> Enum.filter(&divisor_sum_multiple?(&1, k))
    |> Enum.reduce(1, &*/2)
  end

  defp divisor_sum_multiple?(n, k) do
    sum = Enum.filter(1..n, fn x -> rem(n, x) == 0 end) |> Enum.sum()
    rem(sum, k) == 0
  end
end

IO.puts DivisorProduct.product(1, 10, 3)
IO.puts DivisorProduct.product(15, 45, 5)

