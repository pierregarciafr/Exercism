class Squares
  attr_reader :number, :square_of_sum, :sum_of_squares, :difference

  def initialize(number)
    @number = number
    @square_of_sum = [*1..number].sum**2
    @sum_of_squares = [*1..number].collect { |x| x**2 }.sum
    @difference = @square_of_sum - @sum_of_squares
  end
end
