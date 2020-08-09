defmodule Cryptolixir.PasswordCreator do
  def return_password(options, length) do
    keyboard_list = parse_options(options, [])
    extract_random(keyboard_list, length, [])
  end

  def return_password(options, length, user_entropy) do
    keyboard_list = parse_options(options, [])
    password = extract_random(keyboard_list, length, [])
    entropy_introducer(keyboard_list, password, user_entropy)
  end

  defp parse_options([], include_list) do
    List.flatten(include_list)
  end

  defp parse_options([head_options | tail_options], include_list) do
    lowercase = ~c(abcdefghijklmnopqrstuvwxyz)
    uppercase = ~c(ABCDEFGHIJKLMNOPQRSTUVWXYZ)
    numbers = ~c(1234567890)
    special = ~c(`-=~!@#$%^&*\(\)_+\[\]\{\}|;':"<>?,./\\)

    add_to_include_list =
      case head_options do
        "lowercase" -> lowercase
        "uppercase" -> uppercase
        "numbers" -> numbers
        "special" -> special
      end

    new_include_list = [add_to_include_list | include_list]

    parse_options(tail_options, new_include_list)
  end

  defp extract_random(_keyboard_list, 0, character_list) do
    character_list
  end

  defp extract_random(keyboard_list, length, character_list) do
    shuffled = Enum.shuffle(keyboard_list)
    random_character = Enum.random(shuffled)
    added_character_list = [random_character | character_list]
    extract_random(shuffled, length - 1, added_character_list)
  end
end
