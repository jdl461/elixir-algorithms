defmodule BWT do
  @moduledoc """
  Burrows-Wheeler transform, and its inverse.
  """

  alias BWT.Transform
  alias BWT.Inverse

  @doc ~S"""
  Transforms a given binary.

  Returns a binary.

  ## Examples
    iex> BWT.transform("^banana")
    <<97, 0, 110, 110, 98, 94, 97, 97>>

    iex> BWT.transform("")
    ""
  """
  def transform(s) when is_binary(s) do
    Transform.transform(s)
  end

  @doc """
  Performs the inverse Burroughs-Wheeler transform on the given binary to recover
  the original.

  Returns a string.

  ## Examples
    iex> BWT.inverse("")
    ""

    iex> BWT.inverse(<<97, 0, 110, 110, 98, 94, 97, 97>>)
    "^banana"
  """
  def inverse(s) when is_binary(s) do
    Inverse.inverse(s)
  end
end
