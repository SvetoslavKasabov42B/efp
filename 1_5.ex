defmodule NumberCheck do
  def increasing_n(n) when is_integer(n) and n > 0 do
    digits = Integer.to_string(n) |> String.graphemes() |> Enum.map(&String.to_integer/1)
    
    if Enum.sort(digits) == digits and Enum.uniq(digits) == digits do
      "#{n} Да, в нарастващ ред са!"
    else
      "#{n} Не, не са в нарастващ ред!"
    end
  end
end

IO.puts NumberCheck.increasing_n(12489) 
IO.puts NumberCheck.increasing_n(4456) 
IO.puts NumberCheck.increasing_n(13579)
IO.puts NumberCheck.increasing_n(987)   

