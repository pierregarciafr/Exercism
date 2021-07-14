# frozen_string_literal: true

# Neme nombre premier
module Prime
  class << self
    def nth(int)
      raise(ArgumentError) unless int.positive?

      premiers = [2]
      number = 2
      until premiers.length == int
        number += 1
        multiples = premiers.select { |premier| (number % premier).zero? }
        premiers << number if multiples.empty?
      end
      premiers.max
    end
  end
end
