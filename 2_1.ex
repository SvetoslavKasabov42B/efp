defmodule ListOperations do
  def duplicates(list1, list2) do
    list1
    |> Enum.filter(fn x -> Enum.count(list2, fn y -> y == x end) > 1 end)
  end
end

# Пример:
IO.inspect ListOperations.duplicates([1, 2, 3], [1, 2, 1, 3, 2])  # [1, 2]

