class Triplet
  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def sum
    @a + @b + @c
  end

  def product
    @a * @b * @c
  end

  def pythagorean?
    @a**2 + @b**2 == @c**2
  end

  def self.where(sum: nil, min_factor:1, max_factor:1)
    (min_factor..max_factor).each_with_object([]) do |c, triplets|
      (min_factor..c).each do |b|
        (min_factor..b).each do |a|
          triplet = new(a,b,c)
          next if sum && triplet.sum != sum

          triplets << triplet if triplet.pythagorean?
        end
      end
    end
  end
end

