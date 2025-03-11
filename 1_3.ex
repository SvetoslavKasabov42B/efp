defmodule LuckyNumber do
  def is_lucky?(num) when is_integer(num) and num > 0 do
    digits = Integer.to_string(num) |> String.graphemes() |> Enum.map(&String.to_integer/1)
    
    if rem(length(digits), 2) != 0 do
      false  
    else
      n = div(length(digits), 2)
      first_half = Enum.slice(digits, 0, n)
      second_half = Enum.slice(digits, n, n)

      Enum.sum(first_half) == Enum.sum(second_half)
    end
  end
end

IO.puts LuckyNumber.is_lucky?(123321)  # true (1+2+3 == 3+2+1)
IO.puts LuckyNumber.is_lucky?(123456)  # false (1+2+3 != 4+5+6)
IO.puts LuckyNumber.is_lucky?(987654)  # false (9+8+7 != 6+5+4)

