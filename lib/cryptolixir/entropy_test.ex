defmodule EntropyTest do
  def entropy_introducer(keyboard_list, password, user_entropy) do
    for character <- password, do: calc_entropy(keyboard_list, character, user_entropy)
  end

  defp calc_entropy(keyboard_list, character, user_entropy) do
    keyboard_list_length = Enum.count(keyboard_list)

    IO.inspect(user_entropy, label: "User Entropy")

    random_number = Enum.random(character..999_999_999)
    IO.inspect(random_number, label: "Random Number")

    IO.inspect(character, label: "Character")

    entropy = (pow(random_number, character) |> round) * user_entropy
    IO.inspect(entropy, label: "User Entropy * Random Number * Character")

    entropy_position = rem(entropy, keyboard_list_length - 1)
    IO.inspect(entropy_position, label: "Modulus Entropy Times Character to Keyboard Length -1")

    Enum.at(keyboard_list, entropy_position)
  end


    defp pow(_, 0), do: 1
    defp pow(x, n) when rem(n, 2) == 1, do: x * pow(x, n - 1)

    defp pow(x, n) do
      result = pow(x, div(n, 2))
      result * result
    end
end
