# frozen_string_literal: true

# class documentation
class RailFenceCipher

  def self.encode(a_message, this_amount_of_rails)
    RailFenceCipherEncoder.new(a_message, this_amount_of_rails).encode
  end

  def self.decode(a_message, this_amount_of_rails)
    RailFenceCipherDecoder.new(a_message, this_amount_of_rails).decode
  end

  private

  def initialize(message, amount_of_rails)
    @message = message
    @length = message.length
    @amount_of_rails = amount_of_rails
  end

  attr_reader :message, :message_length, :amount_of_rails

  def generate_pattern
    0.upto(@amount_of_rails - 1).to_a.concat((@amount_of_rails - 2).downto(1).to_a)
  end
end

class RailFenceCipherEncoder < RailFenceCipher
  def encode
    encoded = Array.new(@amount_of_rails) { Array.new(@length, '.') }
    pattern = generate_pattern

    (0...@length).each do |x|
      encoded[pattern[x % pattern.length]][x] = @message[x]
    end
    encoded.flatten!.delete('.')
    encoded.join
  end
end

class RailFenceCipherDecoder < RailFenceCipher
  def decode
    array = Array.new(@amount_of_rails) { Array.new(@length, '.') }
    string_arr = @message.chars
    pattern = generate_pattern

    (0...@length).each do |column|
      array[pattern[column % pattern.length]][column] = '?'
    end

    (0...@amount_of_rails).each do |row|
      (0...@length).each do |column|
        array[row][column] = string_arr.shift if array[row][column] == '?'
      end
    end

    decoded = array.transpose.flatten!
    decoded.delete('.')
    decoded.join
  end
end


p RailFenceCipher.encode('XOXOXOXOXOXOXOXOXO', 2)
p RailFenceCipher.decode('TEITELHDVLSNHDTISEIIEA', 3)
