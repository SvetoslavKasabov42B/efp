defmodule LetterFrequency do
  def count_letters(string) do
    string
    |> String.graphemes()  
    |> Enum.frequencies()  
    |> Enum.each(fn {letter, count} -> IO.puts("#{letter}: #{count}") end)
  end
end

LetterFrequency.count_letters("gospodin")

