class Luhn

  private

  def initialize(card_number)
    @card_number = card_number
  end

  def single_digit?
    filter_digits.size == 1
  end

  def unauthorized_character?
    !@card_number.scan(/\D/).reject { |char| char == " " }.empty?
  end

  def filter_digits
    @card_number.scan(/[0-9]/)
  end

  public

  def valid?
    return false if single_digit?
    return false if unauthorized_character?

    filter_digits.reverse.each_with_index.map do |digit, index|
      if digit.to_i == 9
        9
      elsif index % 2 == 1
        ((digit.to_i * 2) % 9)
      else
        digit.to_i
      end
    end
                 .sum % 10 == 0
  end

  def self.valid?(card_number)
    new(card_number).valid?
  end

end


if $PROGRAM_NAME == __FILE__
  puts Luhn.valid?('091')
  puts Luhn.valid?("0000 0") # true
  puts Luhn.valid?("095 245 88") # true
  puts Luhn.valid?("055-444 286") # false expected
end