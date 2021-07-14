module Luhn
  class << self
    def valid?(string)
      return false if single_digit?(string) || non_digit_included?(string)

      filter_digits(string).reverse.each_with_index.map do |digit, index|
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

    def single_digit?(string)
      filter_digits(string).size == 1
    end

    def non_digit_included?(string)
      /[a-z]/.match(string)
    end

    def filter_digits(string)
      string.gsub(' ', '').chars
    end

  end
end

if $PROGRAM_NAME == __FILE__
  puts Luhn.valid?('091')
end