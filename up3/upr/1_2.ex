defmodule MaxNumber do
  def find_max do
    IO.puts("Въведете първото число:")
    num1 = IO.gets("") |> String.trim() |> parse_float()

    IO.puts("Въведете второто число:")
    num2 = IO.gets("") |> String.trim() |> parse_float()

    if num1 > num2 do
      IO.puts("По-голямото число е: #{num1}")
    else
      IO.puts("По-голямото число е: #{num2}")
    end
  end

  defp parse_float(input) do
    case Float.parse(input) do
      {number, _} -> number
      :error -> String.to_float(input)
    end
  end
end

MaxNumber.find_max()

