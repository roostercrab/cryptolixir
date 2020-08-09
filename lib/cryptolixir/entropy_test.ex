defmodule EntropyTest do
  def entropy_introducer(_keyboard_list, 0, _user_entropy, character_list) do
    character_list
  end

  def entropy_introducer(keyboard_list, length, user_entropy, character_list) do
    shuffled = Enum.shuffle(keyboard_list)

    keyboard_list_length = Enum.count(keyboard_list)

    entropy = pow(user_entropy, keyboard_list_length)

    random_number = Enum.random(keyboard_list_length..entropy)
    random_position = Enum.random(0..(keyboard_list_length - 1))
    combined_random = rem(random_number, random_position)

    random_character = Enum.at(keyboard_list, combined_random)

    added_character_list = [random_character | character_list]

    entropy_introducer(shuffled, length - 1, user_entropy, added_character_list)
  end

  defp pow(_, 0), do: 1
  defp pow(x, n) when rem(n, 2) == 1, do: x * pow(x, n - 1)

  defp pow(x, n) do
    result = pow(x, div(n, 2))
    result * result
  end
end
