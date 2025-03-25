defmodule GameOfLife do
  def next_generation(grid) do
    for {row, y} <- Enum.with_index(grid), {cell, x} <- Enum.with_index(row) do
      {x, y, next_state(cell, count_neighbors(grid, x, y))}
    end
    |> Enum.group_by(fn {_, y, _} -> y end, fn {_, _, state} -> state end)
    |> Enum.map(fn {_, row} -> row end)
  end

  defp next_state(1, neighbors) when neighbors in 2..3, do: 1
  defp next_state(0, 3), do: 1
  defp next_state(_, _), do: 0

  defp count_neighbors(grid, x, y) do
    directions = [-1, 0, 1]
    directions
    |> Enum.flat_map(fn dx -> Enum.map(directions, fn dy -> {dx, dy} end) end)
    |> Enum.reject(&(&1 == {0, 0}))
    |> Enum.count(fn {dx, dy} -> get_cell(grid, x + dx, y + dy) == 1 end)
  end

  defp get_cell(grid, x, y) do
    case Enum.at(grid, y, []) |> Enum.at(x, 0) do
      nil -> 0
      value -> value
    end
  end
end

grid = [
  [0, 1, 0],
  [0, 1, 1],
  [0, 1, 0]
]

IO.inspect GameOfLife.next_generation(grid)

