defmodule CheckNumber do
  def check_sum do
    IO.puts("Въведете цяло трицифрено число:")
    number = IO.gets("") |> String.trim() |> String.to_integer()

    if number >= 100 and number <= 999 do
      digits = Integer.digits(number)
      sum = Enum.sum(digits)

      if rem(sum, 2) == 0 do
        IO.puts("Сумата на цифрите е четно число.")
      else
        IO.puts("Сумата на цифрите е нечетно число.")
      end
    else
      IO.puts("Числото не е трицифрено.")
    end
  end
end

CheckNumber.check_sum()
