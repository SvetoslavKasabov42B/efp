defmodule FastExp do
  def power(_, 0), do: 1
  def power(x, n) when rem(n, 2) == 0 do
    half = power(x, div(n, 2))
    half * half
  end
  def power(x, n) do
    half = power(x, div(n, 2))
    x * half * half
  end
end

IO.puts FastExp.power(2, 10)  # 1024
IO.puts FastExp.power(3, 5)   # 243
IO.puts FastExp.power(5, 0)   # 1

