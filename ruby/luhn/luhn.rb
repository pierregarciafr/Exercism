class Luhn

  REGULAR_EXPRESSION = {
    digit_or_space: /[[:digit:]]|[[:blank:]]/,
    digit: /[[:digit:]]/
  }

  def self.valid?(account)
    new(account).status
  end

  private

  def initialize(account)
    @account = filter_digits(account) if check(account)
    @status = valid?(@account) if @account
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

  def check(account)
    return true if only_digits?(account) && !single_digit?(account)

    false
  end

  def transform(digit, index)
    if digit.to_i == 9
      9
    elsif index % 2 == 1
      ((digit.to_i * 2) % 9)
    else
      digit.to_i
    end
  end

  def array(account)
    account
      .reverse
      .each_with_index
      .map do |digit, index|
        transform(digit, index)
      end
  end

  def valid?(account)
    array(account).sum % 10 == 0
  end

  public

  attr_reader :status

end

if $PROGRAM_NAME == __FILE__
  puts Luhn.valid?('091')
  puts Luhn.valid?("0000 0") # true
  puts Luhn.valid?("095 245 88") # true
  puts Luhn.valid?("055-444 286") # false expected
  puts Luhn.valid?('1')
end