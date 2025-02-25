defmodule MoraskiShah do
  def start_game do
    board = %{
      {0, 0} => " ", {0, 1} => " ", {0, 2} => " ",
      {1, 0} => " ", {1, 1} => " ", {1, 2} => " ",
      {2, 0} => " ", {2, 1} => " ", {2, 2} => " "
    }
    play(board, "X")
  end

  def play(board, current_player) do
    IO.puts("Current board:")
    print_board(board)

    IO.puts("Player #{current_player}, make your move (row col):")
    {row, col} = get_move()

    if board[{row, col}] != " " do
      IO.puts("Cell already taken! Try again.")
      play(board, current_player)
    else
      new_board = Map.put(board, {row, col}, current_player)
      
      if winner?(new_board, current_player) do
        IO.puts("Player #{current_player} wins!")
        print_board(new_board)
      else
        next_player = if current_player == "X", do: "O", else: "X"
        play(new_board, next_player)
      end
    end
  end

  defp print_board(board) do
    for row <- 0..2 do
      IO.puts("#{board[{row, 0}]} | #{board[{row, 1}]} | #{board[{row, 2}]}") 
      if row < 2, do: IO.puts("---+---+---")
    end
  end

  defp get_move do
    {row, col} = IO.gets("Enter row and column (0-2, space-separated): ")
                 |> String.trim()
                 |> String.split()
                 |> Enum.map(&String.to_integer/1)
                 |> List.to_tuple()
    {row, col}
  end

  defp winner?(board, player) do
    Enum.any?([
      [{0, 0}, {0, 1}, {0, 2}], # First row
      [{1, 0}, {1, 1}, {1, 2}], # Second row
      [{2, 0}, {2, 1}, {2, 2}], # Third row
      [{0, 0}, {1, 0}, {2, 0}], # First column
      [{0, 1}, {1, 1}, {2, 1}], # Second column
      [{0, 2}, {1, 2}, {2, 2}], # Third column
      [{0, 0}, {1, 1}, {2, 2}], # Diagonal
      [{0, 2}, {1, 1}, {2, 0}]  # Reverse diagonal
    ], fn positions -> 
      Enum.all?(positions, fn {r, c} -> board[{r, c}] == player end)
    end)
  end
end

# To start the game:
MoraskiShah.start_game()

