defmodule NumberCheck do
  def check(n) do
    IO.puts(if rem(n, 2) == 0, do: "Even", else: "Odd")
  end
end

NumberCheck.check(10)
NumberCheck.check(5)
NumberCheck.check(4)
