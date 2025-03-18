defmodule NOK do
  def nok(a, 0), do: if a < 0, do: -a, else: a

  def nok(a, b) do
    nok(b, a - div(a, b) * b)
  end
end

IO.puts NOK.nok(12,8)
