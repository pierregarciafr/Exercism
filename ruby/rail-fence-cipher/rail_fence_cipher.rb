# frozen_string_literal: true

# class documentation
class RailFenceCipher

  def self.encode(string, rows)

    encoded = Array.new(rows) { Array.new(string.length, '.') }
    pattern = 0.upto(rows - 1).to_a.concat((rows - 2).downto(1).to_a)

    (0...string.length).each do |x|
      encoded[pattern[x % pattern.length]][x] = string[x]
    end
    encoded.flatten!.delete('.')
    encoded.join
  end

  def self.decode(string, rows)
    length = string.length
    array = Array.new(rows) { Array.new(length, '.') }
    string_arr = string.chars
    p pattern = 0.upto(rows - 1).to_a.concat((rows - 2).downto(1).to_a)

    (0...length).each do |column|
      array[pattern[column % pattern.length]][column] = '?'
    end

    (0...rows).each do |row|
      (0...length).each do |column|
        array[row][column] = string_arr.shift if array[row][column] == '?'
      end
    end

    decoded = array.transpose.flatten
    decoded.delete('.')
    decoded.join
  end

end

p RailFenceCipher.encode('XOXOXOXOXOXOXOXOXO', 2)
# p RailFenceCipher.decode('TEITELHDVLSNHDTISEIIEA', 3)
