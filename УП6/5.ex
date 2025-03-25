defmodule SmallestNumber do
  def find(a, b, k) do
    a..b
    |> Enum.find(&divisible_digit_sum?(&1, k))
  end

  defp divisible_digit_sum?(n, k) do
    sum = Integer.digits(n) |> Enum.sum()
    rem(sum, k) == 0
  end
end

IO.puts SmallestNumber.find(10, 50, 3) 
IO.puts SmallestNumber.find(100, 200, 5)

