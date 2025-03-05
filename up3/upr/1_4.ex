defmodule SortNumbers do
  def sort_numbers do
    IO.puts("Въведете първото число:")
    num1 = IO.gets("") |> String.trim() |> parse_float()

    IO.puts("Въведете второто число:")
    num2 = IO.gets("") |> String.trim() |> parse_float()

    IO.puts("Въведете третото число:")
    num3 = IO.gets("") |> String.trim() |> parse_float()

    sorted = Enum.sort([num1, num2, num3])
    IO.puts("Числата във възходящ ред са: #{Enum.join(sorted, ", ")}")
  end

  defp parse_float(input) do
    case Float.parse(input) do
      {number, _} -> number
      :error -> String.to_float(input)
    end
  end
end

SortNumbers.sort_numbers()

