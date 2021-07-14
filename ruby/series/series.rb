class Series
  def initialize(string)
    @string = string
  end

  def slices(num)
    raise ArgumentError if num > @string.length

    (0..@string.length - num).map do |i|
      @string.slice(i, num)
    end
  end
end
