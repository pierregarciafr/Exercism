class Triangle
  def initialize(array)
    @array = array
    @a, @b, @c = *array.sort
  end

  def equilateral?
    valid? && @array.uniq.count == 1
  end

  def isosceles?
    valid? && @array.uniq.count <= 2
  end

  def scalene?
    valid? && @array.uniq.count == 3
  end

  private

  def valid? # includes the no zero condition
    @a + @b > @c
  end

end

