class Sieve
  def initialize(n)
    @all = n > 1 ? (2..n).to_a : []
  end

  def primes
    @result = @all
    @all.each do |number|
      @result -= (number..@all.last).step(number).to_a[1..-1]
    end
    @result
  end
end
