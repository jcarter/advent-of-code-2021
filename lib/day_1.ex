defmodule Day1 do
  @behaviour Solution

  @test_input """
  199
  200
  208
  210
  200
  207
  240
  269
  260
  263
  """

  @doc """
  iex> solve_part_1(#{inspect(@test_input)})
  7
  """
  def solve_part_1(input) do
    input
    |> numbers()
    |> count_increases()
  end

  @doc """
  iex> solve_part_2(#{inspect(@test_input)})
  5
  """
  def solve_part_2(input) do
    input
    |> numbers()
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> count_increases()
  end

  defp numbers(input) do
    input
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  defp count_increases(numbers) do
    numbers
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [current, next] -> next > current end)
  end
end
