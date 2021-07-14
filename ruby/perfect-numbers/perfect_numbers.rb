# frozen_string_literal: true

# aliquot
module PerfectNumber
  class << self
    def classify(number)
      raise(RuntimeError) unless number.positive?

      case sum_of_multiples(number) <=> number
      when 0
        'perfect'
      when -1
        'deficient'
      when 1
        'abundant'
      end
    end

    def sum_of_multiples(number)
      (1...number).to_a.select { |value| (number % value).zero? }.sum
    end
  end
end
