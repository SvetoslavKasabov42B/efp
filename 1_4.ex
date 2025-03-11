defmodule PrimePalindrome do
  defp is_prime(n) when n < 2, do: false
  defp is_prime(n) do
    2..:math.sqrt(n) |> Enum.all?(fn i -> rem(n, i) != 0 end)
  end

  defp is_palindrome(n) do
    str = Integer.to_string(n)
    str == String.reverse(str)
  end

  def find_prime_palindromes(start, finish) do
    start..finish
    |> Enum.filter(fn n ->
      is_prime(n) && not is_palindrome(n) && is_prime(reverse_number(n))
    end)
    |> Enum.sort()
  end

  defp reverse_number(n) do
    n
    |> Integer.to_string()
    |> String.reverse()
    |> String.to_integer()
  end
end

IO.inspect PrimePalindrome.find_prime_palindromes(10, 100)

