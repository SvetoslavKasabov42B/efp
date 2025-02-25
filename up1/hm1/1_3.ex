defmodule TriangleType do
  def by_sides(a, b, c) do
    cond do
      a + b <= c or a + c <= b or b + c <= a -> "Invalid"
      a == b and b == c -> "Equilateral"
      a == b or a == c or b == c -> "Isosceles"
      true -> "Scalene"
    end
  end

  def by_angles(a, b, c) do
    cond do
      a + b + c != 180 -> "Invalid"
      a == 90 or b == 90 or c == 90 -> "Right"
      a > 90 or b > 90 or c > 90 -> "Obtuse"
      true -> "Acute"
    end
  end
end
IO.puts(TriangleType.by_sides(3, 4, 5))  # Scalene
IO.puts(TriangleType.by_sides(5, 5, 5))  # Equilateral
IO.puts(TriangleType.by_angles(90, 45, 45))  # Right
IO.puts(TriangleType.by_angles(100, 40, 40))  # Obtuse

