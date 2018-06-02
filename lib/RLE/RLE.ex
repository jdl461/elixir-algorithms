defmodule RLE do
  @moduledoc ~S"""
  Perform run-length encoding and decoding.
  """

  @doc ~S"""
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

      iex> RLE.encode("a")
      [{"a", 1}]

      iex> RLE.encode("😀")
      [{"😀", 1}]

      iex> RLE.encode("aaaabbcdeeeeff")
      [{"a", 4}, {"b", 2}, {"c", 1}, {"d", 1}, {"e", 4}, {"f", 2}]
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

  @doc ~S"""
  Decodes a run-length encoded string.

  Returns a string.

  ## Examples

    iex> RLE.decode([])
    ""

    iex> RLE.decode([{"a", 1}])
    "a"

    iex> RLE.decode([{"😀", 2}, {"😁", 1}, {"😂", 5}, {"a", 3}, {"😚", 2}, {"😿", 1}, {"🤷‍♂️", 1}, {"🧜‍♀️", 2}, {"🤵", 1}])
    "😀😀😁😂😂😂😂😂aaa😚😚😿🤷‍♂️🧜‍♀️🧜‍♀️🤵"
  """
  def decode(encoded) do
    case encoded do
      [] -> ""
      [{char, count} | t] -> String.pad_trailing("", count, char) <> decode(t)
    end
  end
end
