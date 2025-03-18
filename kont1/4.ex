defmodule ListDuplicates do
  def find_duplicates(list1, list2) do
    list1 |> Enum.filter(&(&1 in list2 && Enum.count(list2, fn x -> x == &1 end) > 1))
  end
end

list1 = [1, 2, 3]
list2 = [1, 2, 1, 3, 2]

duplicates = ListDuplicates.find_duplicates(list1, list2)
IO.inspect(duplicates)
