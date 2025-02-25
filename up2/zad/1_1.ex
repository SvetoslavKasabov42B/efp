defmodule Calculator do
  def sc(r) do
    p=2*:math.pi()*r
    IO.puts("Периметъра на о: #{p}")
  end
end

{r, _} = IO.gets("Въведете радиус: ")
|> String.trim()
|> Float.parse()

Calculator.sc(r)

