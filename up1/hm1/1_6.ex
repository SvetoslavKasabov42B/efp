defmodule StrawDistributor do
  def calculate_boxes(straws) do
    large_boxes = div(straws, 50)
    remaining_straws = rem(straws, 50)

    medium_boxes = div(remaining_straws, 20)
    remaining_straws = rem(remaining_straws, 20)

    small_boxes = div(remaining_straws, 5)
    remaining_straws = rem(remaining_straws, 5)

    # Проверяваме дали има остатъчни сламки, които не могат да се поберат в малка кутия
    total_boxes = large_boxes + medium_boxes + small_boxes + (if remaining_straws > 0, do: 1, else: 0)
    
    total_boxes
  end

  def get_input do
    IO.puts "Въведете броя на сламките:"
    straws = String.to_integer(IO.gets("> ") |> String.trim)
    IO.puts "Нужни са #{calculate_boxes(straws)} кутии."
  end
end

StrawDistributor.get_input()

