defmodule EntropyTest do
  def entropy_introducer(keyboard_list, password, 0) do
    entropy = Enum.random(128..999_999_999_999_999_999) * Enum.random(128..999_999_999_999_999_999)

    for character <- password, do: calc_entropy(keyboard_list, entropy, character)
  end

  def entropy_introducer(keyboard_list, password, user_entropy) do
    entropy = user_entropy * Enum.random(128..999_999_999_999_999_999)

    for character <- password, do: calc_entropy(keyboard_list, entropy, character)
  end

  defp calc_entropy(keyboard_list, entropy, character) do
    # stringed_character = to_string(character)
    # <<character_number, 0>> = stringed_character <> <<0>>

    keyboard_list_length = Enum.count(keyboard_list)

    entropy_position = rem((entropy * character), keyboard_list_length)
    IO.puts(entropy_position)
    IO.puts(is_number(entropy_position))
    Enum.at(keyboard_list, entropy_position)
  end
end
