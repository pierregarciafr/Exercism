class RunLengthEncoding


  def self.encode(string)

    return '' if string.empty?

    return string if string.length == 1

    result = ""
    array = string.chars

    until array.empty? do
      letter = array.shift

      letter_count = 1

      until letter != array[0]

        compare = array.shift

        letter_count += 1
      end

        result += letter_count > 1 ? ( letter_count.to_s + letter) : letter
    end
    result
  end

  def self.decode(string)

    return '' if string.empty?

    return string if string.length == 1

    result = ""
    array = string.split("")

    until array.empty? do

      character = array.shift

      if /\d/.match(character)

        character += array.shift if /\d/.match(array[0])
        character = array.shift * character.to_i
      end
      result += character
    end
    result
  end
end

# p RunLengthEncoding.decode("12X4 YZ")
# p RunLengthEncoding.encode("XYZ")
# p RunLengthEncoding.encode("XXXYYZEEEZZ")
