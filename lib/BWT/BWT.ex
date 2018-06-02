defmodule BWT do
  @moduledoc """
  An unoptimized implementation of the Burroughs-Wheeler transform, and its inverse.  
  """

  alias BWT.Transform
  alias BWT.Inverse

  @doc """
  Transforms the given binary using the Burroughs-Wheeler transformation.
  """
  def transform(s) when is_binary(s) do
    Transform.transform(s) 
  end

  @doc """
  Performs the inverse Burroughs-Wheeler transformation on the given binary to recover
  the original.
  """
  def inverse(s) when is_binary(s) do
    Inverse.inverse(s)
  end

end
