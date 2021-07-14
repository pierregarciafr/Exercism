# frozen_string_literal: true

# version de joao
class RailFenceCipher
  TEMPLATE_EMPTY_CHAR = '.'
  TEMPLATE_FILL_CHAR = '?'

  def self.encode(a_message, this_amount_of_rails)
    RailFenceCipherEncoder.new(a_message, this_amount_of_rails).encode
  end

  def self.decode(a_message, this_amount_of_rails)
  end

  private

  def initialize(message, amount_of_rails)
    @message = message
    @message_chars = extract_chars(message)
    @message_length = @message.chars.length
    @amount_of_rails = amount_of_rails
  end

  attr_reader :message, :message_chars, :message_length, :amount_of_rails

  def generate_template(alphabet: template_default_alphabet)
    rails = amount_of_rails.times.collect { message_length.times.collect { TEMPLATE_EMPTY_CHAR } }
    insertion_sequence = alternating_sequence

    # à analyser
    message_length.times do |column|
      rails[insertion_sequence.shift]
    end

    rails
  end

  def join_template()
  end

  def extract_chars(a_string)
    a_string.gsub(/\W/, '').chars
  end

  def alternating_sequence # pattern sur tte la longueur
    max = amount_of_rails - 1
    direction = 1
    current = 0

    result = [current]

    (message_length - 1).times do
      current += direction
      direction *= -1 if current.zero?
      result << current
    end
    result
  end

  def template_default_alphabet
  end

  def valid_number_of_rails?
    @amount_of_rails > 1 && message_length > amount_of_rails
  end

  def join_template(template)
    p "template #{template}"
    template.map(&:join).join
  end

  def remove_empty_char(string)
    string.gsub(TEMPLATE_EMPTY_CHAR, '')
  end
end

class RailFenceCipherEncoder < RailFenceCipher
  def encode
    return message unless valid_number_of_rails?

    rails = generate_template(alphabet: message_chars.each)
    remove_empty_char(join_template(rails))
  end
end


class RailFenceCipherDecoder < RailFenceCipher
  def decode

  end
end

p RailFenceCipher.encode('XOXOXOXOXOXOXOXOXO', 2)

