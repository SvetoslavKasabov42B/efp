defmodule SortNumbers do
  defp parse_input do
    IO.gets("Въведете три положителни числа, разделени с интервал: ")
    |> String.trim()
    |> String.split()
    |> Enum.map(&Float.parse/1)
    |> Enum.map(&elem(&1, 0))
  end

  def sort_and_print do
    numbers = parse_input()
    sorted_numbers = Enum.sort(numbers)
    IO.puts(Enum.join(sorted_numbers, " "))
  end
end

SortNumbers.sort_and_print()

