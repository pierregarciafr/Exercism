# frozen_string_literal: true

# aliquot
class PerfectNumber

  private

  def initialize(number)
    @number = number
  end

  def sum_of_multiples
    (1...@number).to_a.select { |value| (@number % value).zero? }.sum
  end

  public

  def classify
    raise(RuntimeError) unless @number.positive?

    case sum_of_multiples <=> @number
    when 0
      'perfect'
    when -1
      'deficient'
    when 1
      'abundant'
    end
  end

  def self.classify(number)
    new(number).classify
  end

end
