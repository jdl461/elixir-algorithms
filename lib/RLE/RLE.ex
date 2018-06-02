defmodule RLE do
  @doc ~S"""
  Perform run-length encoding and decoding.

  ## Examples

      iex> RLE.encode("😀😀😁😂aaaa😚😚😿🤷‍♂️🧜‍♀️🧜‍♀️🤵")
      [
        {"😀", 2},
        {"😁", 1},
        {"😂", 1},
        {"a", 4},
        {"😚", 2},
        {"😿", 1},
        {"🤷‍♂️", 1},
        {"🧜‍♀️", 2},
        {"🤵", 1}
      ]
      
      iex> RLE.encode("")
      []

      iex> RLE.encode("aaaabbcdeeeeff")
      [{"a", 4,}, {"b", 2}, {"c", 1}, {"d", 1}, {"e", 4}, {"f", 2}]
  """

  def encode(string) do
    case String.graphemes(string) do
      [] -> []
      [h | t] -> encode(h, t, 1, [])
    end
  end

  defp encode(char, [], count, output) do
    output ++ [{char, count}]
  end

  defp encode(char, string, count, output) do
    [h | t] = string

    if char == h do
      encode(char, t, count + 1, output)
    else
      encode(h, t, 1, output ++ [{char, count}])
    end
  end

  def decode(encoded) do
  end
end
