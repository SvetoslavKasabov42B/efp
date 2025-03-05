defmodule MaxNumber do
  def find_max do
    IO.puts("Въведете първото число:")
    num1 = IO.gets("") |> String.trim() |> parse_float()

    IO.puts("Въведете второто число:")
    num2 = IO.gets("") |> String.trim() |> parse_float()

    IO.puts("Въведете третото число:")
    num3 = IO.gets("") |> String.trim() |> parse_float()

    max_num = Enum.max([num1, num2, num3])
    IO.puts("Най-голямото число е: #{max_num}")
  end

  defp parse_float(input) do
    case Float.parse(input) do
      {number, _} -> number
      :error -> String.to_float(input)
    end
  end
end

MaxNumber.find_max()

