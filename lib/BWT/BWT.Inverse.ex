defmodule BWT.Inverse do
  def inverse(s) do
    table = init_table(s)

    build_table(s, table, 2)
    |> Enum.filter(&(String.last(&1) == <<0>>))
    |> to_string
    |> String.trim(<<0>>)
  end

  defp build_table(s, table, n) do
    if String.length(s) == n do
      add(s, table)
    else
      new_table = add(s, table)
      build_table(s, new_table, n + 1)
    end
  end

  defp init_table(s) do
    String.split(s, "", trim: true)
    |> Enum.sort()
  end

  defp add(s, table) do
    String.split(s, "", trim: true) |> Enum.zip(table) |> Enum.map(&append_table/1) |> Enum.sort()
  end

  defp append_table({row, char}) do
    row <> char
  end
end
