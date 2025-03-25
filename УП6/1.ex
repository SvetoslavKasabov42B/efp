defmodule Series do
  def sum(n) when is_integer(n) and n > 0 do
    0..(n - 1)
    |> Enum.map(fn i -> 1 / (1 + i * 3) end)
    |> Enum.sum()
  end
end

IO.puts Series.sum(1) 
IO.puts Series.sum(2)  
IO.puts Series.sum(50)  

