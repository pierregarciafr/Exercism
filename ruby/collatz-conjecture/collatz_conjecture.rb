# frozen_string_literal: true

# module doc comment

class CollatzConjecture

  private

  def initialize(start_value)
    @start_value = start_value
  end

  def operate(int)
    int.even? ? int / 2 : 3 * int + 1
  end

  public

  def self.steps(start_value)
    new(start_value).steps
  end

  def steps
    raise(ArgumentError) unless @start_value.positive?
    
    count = 0
    value = @start_value
    until value == 1
      value = operate(value)
      count += 1
    end
    count
  end
end

if $PROGRAM_NAME == __FILE__
  p CollatzConjecture.steps(1_000_000)
end