defmodule SymmetricNumber do
  def check_symmetric do
    IO.puts("Въведете четирицифрено число:")
    number = IO.gets("") |> String.trim() |> String.to_integer()

    if is_symmetric(number) do
      IO.puts("Числото е симетрично.")
    else
      IO.puts("Числото не е симетрично.")
    end
  end

  defp is_symmetric(number) do
    number
    |> Integer.to_string()
    |> String.split("", trim: true)
    |> Enum.reverse()
    |> Enum.join() == Integer.to_string(number)
  end
end

SymmetricNumber.check_symmetric()

