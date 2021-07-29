class Luhn

  REGULAR_EXPRESSION = {
    digit_or_space: /[[:digit:]]|[[:blank:]]/,
    digit: /[[:digit:]]/
  }

  attr_reader :status

  private

  def initialize(account)
    @account = check_input(account) ? filter_digits(account) : nil
    @status = @account.nil? ? false : luhn_valid?(@account)
  end

  def filter_digits(account)
    account.scan(REGULAR_EXPRESSION[:digit])
  end

  def only_digits?(account)
    account.scan(REGULAR_EXPRESSION[:digit_or_space]) == account.chars 
  end

  def single_digit?(account)
    filter_digits(account).size == 1
  end

  def check_input(account)
    return false unless only_digits?(account)
    return false if single_digit?(account)

    true
  end

  def luhn_transform(digit, index)
    if digit.to_i == 9
      9
    elsif index % 2 == 1
      ((digit.to_i * 2) % 9)
    else
      digit.to_i
    end
  end

  def luhn_array(account)
    account
      .reverse
      .each_with_index
      .map do |digit, index|
        luhn_transform(digit, index)
    end
  end

  def luhn_valid?(account)
    luhn_array(account).sum % 10 == 0
  end

  public

  def self.valid?(account)
    new(account).status
  end

end

if $PROGRAM_NAME == __FILE__
  puts Luhn.valid?('091')
  puts Luhn.valid?("0000 0") # true
  puts Luhn.valid?("095 245 88") # true
  puts Luhn.valid?("055-444 286") # false expected
  puts Luhn.valid?('1')
end