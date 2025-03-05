defmodule CheckNumber do
  def check_product do
    IO.puts("Въведете цяло четирицифрено число:")
    number = IO.gets("") |> String.trim() |> String.to_integer()

    if number >= 1000 and number <= 9999 do
      digits = Integer.digits(number)
      product = Enum.reduce(digits, 1, &*/2)

      if rem(product, 3) == 0 do
        IO.puts("Произведението на цифрите е кратно на 3.")
      else
        IO.puts("Произведението на цифрите не е кратно на 3.")
      end
    else
      IO.puts("Числото не е четирицифрено.")
    end
  end
end

CheckNumber.check_product()

