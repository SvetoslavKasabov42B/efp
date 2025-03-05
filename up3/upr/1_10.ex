defmodule NumberSolver do
  def find_digits do
    IO.puts("Въведете сборът на цифрите (x + y):")
    sum = IO.gets("") |> String.trim() |> String.to_integer()

    IO.puts("Въведете разликата между числата (yx - xy):")
    difference = IO.gets("") |> String.trim() |> String.to_integer()

    {x, y} = solve(sum, difference)
    
    IO.puts("Цифрите на числото са: x = #{x}, y = #{y}")
  end

  defp solve(sum, difference) do
    for x <- 1..9, y <- 1..9 do
      if x + y == sum and (10 * y + x) - (10 * x + y) == difference do
        {x, y}
      end
    end
  end
end

NumberSolver.find_digits()
