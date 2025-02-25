defmodule TripleTrouble do
  def getInput(prompt) do
    IO.gets(prompt) |> String.trim() |> Float.parse() |> elem(0)
  end
  def find_largest do 
    numbers = [
      getInput("Dai purvo: "),
      getInput("Dai vtoro: "),
      getInput("Dai treto: ")
    ]

    largest = Enum.max(numbers)
    IO.puts("Nai golqmoto e: #{largest}")
    end
end

TripleTrouble.find_largest()
