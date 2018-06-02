defmodule BWT.Transform do
  def transform(""), do: ""

  def transform(s) do
    (s <> <<0>>)
    |> rotations(1)
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
    l = String.length(s)
    String.last(s) <> String.slice(s, 0, l - 1)
  end
end
