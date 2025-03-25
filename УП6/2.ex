defmodule ZeroMover do
  def move_zeros(list) do
    {non_zeros, zeros} = Enum.split_with(list, fn x -> x != 0 end)
    non_zeros ++ zeros
  end
end

IO.inspect ZeroMover.move_zeros([1, 0, 1, 2, 0, 1, 3, "a"])

