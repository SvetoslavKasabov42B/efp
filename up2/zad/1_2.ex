defmodule CompareNumbers do
  defp parse_input(prompt) do
    IO.gets(prompt)
    |> String.trim()
    |> Float.parse()
    |> elem(0)
  end

  def find_larger do
    a = parse_input("Въведете първото число: ")
    b = parse_input("Въведете второто число: ")
    
    larger = if a > b, do: a, else: b
    IO.puts("По-голямото число е: #{larger}")
  end
end

CompareNumbers.find_larger()
