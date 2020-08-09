defmodule EntropyTest do
  def entropy_introducer(keyboard_list, password, user_entropy) do
    for character <- password, do: calc_entropy(keyboard_list, character, user_entropy)
  end

  defp calc_entropy(keyboard_list, character, user_entropy) do
    keyboard_list_length = Enum.count(keyboard_list)
    entropy = pow(user_entropy, keyboard_list_length)

    IO.inspect(entropy, label: "Entropy")

    IO.inspect(character, label: "Character")

    entropy_position =
    IO.inspect(entropy_position, label: "Entropy Position")

    Enum.at(keyboard_list, entropy_position)
  end

  defp pow(_, 0), do: 1
  defp pow(x, n) when rem(n, 2) == 1, do: x * pow(x, n - 1)
  defp pow(x, n) do
    result = pow(x, div(n, 2))
    result * result
  end

end
