# frozen_string_literal: true

# module doc comment
module CollatzConjecture
  class << self
    def steps(result)
      raise(ArgumentError) unless n.positive?

      count = 0
      until result == 1
        result = operate(result)
        count += 1
      end
      count
    end

    def operate(int)
      int.even? ? int / 2 : 3 * int + 1
    end
  end
end
