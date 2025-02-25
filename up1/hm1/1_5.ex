defmodule SumDigits do
  # Function to calculate the sum of digits of a number
  def sum_digits(0), do: 0
  def sum_digits(n), do: rem(n, 10) + sum_digits(div(n, 10))

  # Function to read input and compute sum of digits
  def main do
    IO.puts("Enter a number:")
    n = IO.gets("") |> String.trim() |> String.to_integer()
    
    IO.puts("Sum of digits: #{sum_digits(abs(n))}")
  end
end

SumDigits.main()
