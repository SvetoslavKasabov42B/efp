defmodule AreaCalculator do
  def rectangle(w, h), do: w * h
  def square(a), do: a * a
  def circle(r), do: :math.pi() * r * r
  def triangle(b, h), do: 0.5 * b * h
  def parallelepiped(w, h, l), do: 2 * (w * h + w * l + h * l)
  def rhombus(d1, d2), do: 0.5 * d1 * d2
  def cone(r, slant_h), do: :math.pi() * r * (r + slant_h)
  def triangular_pyramid(b, h, slant_h1, slant_h2, slant_h3), do: b * h / 2 + (slant_h1 + slant_h2 + slant_h3) * h / 2
  def quadrilateral_pyramid(base, slant_h), do: base + 4 * (0.5 * slant_h * :math.sqrt(base))
end
IO.puts(AreaCalculator.rectangle(5, 10))
IO.puts(AreaCalculator.square(4))
IO.puts(AreaCalculator.circle(3))
IO.puts(AreaCalculator.triangle(6, 8))
IO.puts(AreaCalculator.parallelepiped(3, 4, 5))
IO.puts(AreaCalculator.rhombus(6, 8))
IO.puts(AreaCalculator.cone(3, 5))
IO.puts(AreaCalculator.triangular_pyramid(6, 8, 5, 5, 5))
IO.puts(AreaCalculator.quadrilateral_pyramid(9, 5))

