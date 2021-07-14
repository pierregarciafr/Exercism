class BinarySearch
  def initialize(array)
    @array = array.sort
  end

  def search_for(el)
    max = @array.length - 1
    min = 0

    while min <= max
      mid = (min + max) / 2
      if @array[mid] == el
        return mid
      elsif @array[mid] > el
        max = mid - 1
      else
        min = mid + 1
      end
    end

    return nil
  end

  def array_length
    @array.size
  end
end

# puts BinarySearch.new([1, 3, 4, 6, 8, 9, 11]).search_for(4)
