defmodule ListSearch do
  def contains(x, list) do
    Enum.member?(list, x)
  end
end

IO.puts ListSearch.contains(5, [1, 2, 3, 4, 5])  # true
IO.puts ListSearch.contains(10, [1, 2, 3, 4, 5]) # false

