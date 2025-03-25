defmodule Duplicates do
  def find(list1, list2) do
    list1
    |> Enum.filter(fn x -> count_occurrences(x, list2) > 1 end)
    |> Enum.uniq()
  end

  defp count_occurrences(x, list), do: Enum.count(list, &(&1 == x))
end

IO.inspect Duplicates.find([1, 2, 3], [1, 2, 1, 3, 2])
IO.inspect Duplicates.find([4, 5, 6], [4, 4, 6, 7, 8])  
IO.inspect Duplicates.find([1, 2, 3], [4, 5, 6])      

