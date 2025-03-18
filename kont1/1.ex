defmodule NumberChecker do
  def in_list?(num, list), do: num in list
end

list = [1, 2, 3, 4, 5, 6, 8, 9, 10, 12, 15, 16, 18, 20, 24, 25]
IO.puts NumberChecker.in_list?(12, list)
IO.puts NumberChecker.in_list?(14, list)
