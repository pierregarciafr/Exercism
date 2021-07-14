class Grains
  def self.square(num)
    raise(ArgumentError) unless (1..64) === num

    2**(num - 1)
  end

  def self.total
    (1..64).map { |j| self.square(j) }.sum
  end
end
