defmodule Hangman do
  def start do
    IO.puts("Welcome to Hangman!")
    word = random_word()
    play(word, [], 6)
  end

  defp random_word do
    words = ["elixir", "hangman", "programming", "developer", "software"]
    Enum.random(words)
  end

  defp play(word, guessed_letters, attempts_left) do
    display_word(word, guessed_letters)
    IO.puts("Attempts left: #{attempts_left}")
    
    if attempts_left == 0 do
      IO.puts("You lost! The word was #{word}.")
    else
      guess = get_guess()
      if Enum.member?(guessed_letters, guess) do
        IO.puts("You already guessed that letter.")
        play(word, guessed_letters, attempts_left)
      else
        guessed_letters = [guess | guessed_letters]
        if Enum.member?(String.graphemes(word), guess) do
          IO.puts("Correct guess!")
          if Enum.all?(String.graphemes(word), fn letter -> Enum.member?(guessed_letters, letter) end) do
            IO.puts("You won! The word is #{word}.")
          else
            play(word, guessed_letters, attempts_left)
          end
        else
          IO.puts("Incorrect guess!")
          play(word, guessed_letters, attempts_left - 1)
        end
      end
    end
  end

  defp display_word(word, guessed_letters) do
    word
    |> String.graphemes()
    |> Enum.map(fn letter -> if Enum.member?(guessed_letters, letter), do: letter, else: "_" end)
    |> Enum.join(" ")
    |> IO.puts()
  end

  defp get_guess do
    IO.gets("Guess a letter: ")
    |> String.trim()
    |> String.downcase()
    |> String.slice(0, 1)
  end
end

Hangman.start()

