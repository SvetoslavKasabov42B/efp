defmodule PerfectNumber do
  def perfect_n(n) when n > 0 do
    sum = Enum.sum(for i <- 1..(div(n, 2)), rem(n, i) == 0, do: i)
    sum == n
  end
end

IO.puts PerfectNumber.perfect_n(6)         # true
IO.puts PerfectNumber.perfect_n(28)        # true
IO.puts PerfectNumber.perfect_n(33550336)  # true
IO.puts PerfectNumber.perfect_n(12)        # false

