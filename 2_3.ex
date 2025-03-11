defmodule GCD do
  def gcd(a, 0), do: a
  def gcd(a, b), do: gcd(b, rem(a, b))
end

IO.puts GCD.gcd(56, 98)  # 14
IO.puts GCD.gcd(101, 10) # 1

