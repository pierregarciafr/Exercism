# frozen_string_literal: true

# palindromic integer suites
class Palindromes
  def initialize(min_factor: 1, max_factor: nil)
    @min_factor = min_factor
    @max_factor = max_factor
  end

  def generate
    array_of_duets = (@min_factor..@max_factor)
                        .to_a
                        .repeated_combination(2)
    selected = array_of_duets.select do |n|
      (n[0] * n[1]).to_s == (n[0] * n[1]).to_s.reverse
    end
    @sorted = selected.sort_by { |duet| duet[0] * duet[1] }
  end

  def largest
    @limit = @sorted.last[0] * @sorted.last[1]
    self
  end

  def smallest
    @limit = @sorted.first[0] * @sorted.first[1]
    self
  end

  def factors
    @sorted.select { |duet| duet[0] * duet[1] == @limit }
  end

  def value
    @limit
  end
end
