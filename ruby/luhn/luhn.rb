class Luhn

  REGULAR_EXPRESSION = {
    digit_or_space: /[[:digit:]]|[[:blank:]]/,
    digit: /[[:digit:]]/
  }

  attr_reader :validity

  private

  def initialize(card_number)
    @validity = card_number.nil? ? false : valid?(card_number)
    # @validity = valid?(card_number)
    # @status = @validity ? luhn_test(card_number) : false

  end

  def only_digits?(card_number) # @card_number n'est que des chiffres ?
    card_number.scan(REGULAR_EXPRESSION[:digit_or_space]) == card_number.chars 
  end

  def filter_digits(card_number)
    card_number.scan(REGULAR_EXPRESSION[:digit])
  end

  def single_digit?(card_number)
    filter_digits(card_number).size == 1
  end

  # def valid?(card_number)
  #   return nil unless only_digits?(card_number)
  #   return nil if single_digit?(card_number)
  # end

  # def luhn_test(card_number)

  #     filter_digits(card_number).reverse.each_with_index.map do |digit, index|
  #     if digit.to_i == 9
  #       9
  #     elsif index % 2 == 1
  #       ((digit.to_i * 2) % 9)
  #     else
  #       digit.to_i
  #     end
  #   end
  # end

  def valid?(card_number)
    return nil unless only_digits?(card_number)
    return nil if single_digit?(card_number)

    filter_digits(card_number).reverse.each_with_index.map do |digit, index|
      if digit.to_i == 9
        9
      elsif index % 2 == 1
        ((digit.to_i * 2) % 9)
      else
        digit.to_i
      end
    end
                 .sum % 10 == 0
    # p luhn_value
    # luhn_value
  end

  public

  def self.valid?(card_number)
    new(card_number).validity # .card_number #.send(:valid?)
  end

end


if $PROGRAM_NAME == __FILE__
  puts Luhn.valid?('091')
  puts Luhn.valid?("0000 0") # true
  puts Luhn.valid?("095 245 88") # true
  puts Luhn.valid?("055-444 286") # false expected
  puts Luhn.valid?('1')
end