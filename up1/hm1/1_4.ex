defmodule NOK do
  # Function to calculate the Greatest Common Divisor (GCD)
  def gcd(a, 0), do: a
  def gcd(a, b), do: gcd(b, rem(a, b))

  # Function to calculate the Least Common Multiple (LCM)
  def lcm(a, b) do
    div(abs(a * b), gcd(a, b))  # Fixed syntax
  end

  # Function to read input and compute LCM
  def main do
    IO.puts("Enter first number:")
    a = IO.gets("") |> String.trim() |> String.to_integer()
    
    IO.puts("Enter second number:")
    b = IO.gets("") |> String.trim() |> String.to_integer()
    
    IO.puts("LCM: #{lcm(a, b)}")
  end
end

NOK.main()

