defmodule RLE do
  def encode(""), do: []

  def encode(string) do
    [h|t] = String.graphemes(string)
    encode(h, t, 1, [])
  end

  defp encode(char, [], count, output) do
    output ++ [{char, count}]
  end

  defp encode(char, string, count, output) do
    [h|t] = string
    if char == h do
      encode(char, t, count + 1, output)
    else
      encode(h, t, 1, output ++ [{char, count}])
    end
  end

  def decode(encoded) do
  end
end

# 😀😀😁😂aaaa😚😚😿🤷‍♂️🧜‍♀️🧜‍♀️🤵

