defmodule NumberUtils do
  def increasing_digits(num) when num < 10, do: IO.puts "Ресултат: Да в нарастващ ред са!" 
  def increasing_digits(num) do last_digit = num |> rem(10)
    remaining = num |> div(10)
    prev_digit = remaining |> rem(10)

    if prev_digit < last_digit do
      increasing_digits(remaining)
    else
      IO.puts "Ресултат: Не са в нарастващ ред са!" 
    end
  end
end

IO.puts NumberUtils.increasing_digits(5689)
