

class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(size_one, size_two, goal_liters, first)
    b_first = Bucket.new('one', size_one)
    b_dest = Bucket.new('two', size_two)
    b_first, b_dest = b_dest, b_first if first == 'two'

    @moves = 0
    until b_first.liters == goal_liters || b_dest.liters == goal_liters
      if b_first.empty?
        b_first.fill
      elsif b_dest.full?
        b_dest.empty
      else
        b_first.pour(b_dest)
      end
      @moves += 1
    end
    @goal_bucket = (b_first.liters == goal_liters)? b_first.name : b_dest.name
    @other_bucket = (b_first.liters == goal_liters)? b_dest.liters : b_first.liters
  end
end

class Bucket
  attr_reader :name, :size, :liters

  def initialize(name, size)
    @name = name
    @size = size
    @liters = 0
  end

  def full?
    @liters == @size
  end

  def empty?
    @liters.zero?
  end

  def fill(liters = @size)
    @liters = [@size, @liters + liters].min
  end

  def empty
    @liters = 0
  end

  def pour(to_bucket)
    liters = [to_bucket.size - to_bucket.liters, @liters].min
    to_bucket.fill(liters)
    @liters -= liters
  end
end

module BookKeeping
  VERSION = 2
end

subject = TwoBucket.new(3, 5, 1, 'two')
puts "#{subject.moves}"
puts "#{subject.goal_bucket}"
puts "#{subject.other_bucket}"
