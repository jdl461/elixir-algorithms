defmodule BWT.Transform do
  def transform(s) do
    rotations(s <> <<0>>, 1)
    |> Enum.sort()
    |> Enum.map(&String.last/1)
    |> Enum.join()
  end

  defp rotations(s, n) do
    if String.length(s) == n do
      [rotate(s)]
    else
      r = rotate(s)
      [r | rotations(r, n + 1)]
    end
  end

  defp rotate(s) do
    [h | t] = String.codepoints(s)
    (t ++ [h]) |> to_string
  end
end
