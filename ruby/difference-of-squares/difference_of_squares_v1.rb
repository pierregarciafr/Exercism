class Squares

  def initialize(n)
    @n_range = (1..n).to_a
  end

  def square_of_sum
    @n_range.sum**2
  end

  def sum_of_squares
    @n_range.map{|i| i**2 }.sum
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
