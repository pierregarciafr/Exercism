#frozen_string_literal: true

# last test (2,3,3,'one')
# 0, 0
# 2, 0
# 0, 2
# 2, 2
# 1, 3


class TwoBucket
  attr_reader :one, :two, :goal_level, :start_bucket, :destination_bucket, :moves, :goal_bucket, :other_bucket

  def initialize(size_of_bucket_one, size_of_bucket_two, goal_level, start_bucket)
    @start_bucket = Bucket.new('one', size_of_bucket_one)
    @destination_bucket = Bucket.new('two', size_of_bucket_two)
    @goal_level = goal_level
    @start_bucket, @destination_bucket = @destination_bucket, @start_bucket if start_bucket == 'two'
    @moves = 0
    start
  end

  private

  def start
    until [@start_bucket.level, @destination_bucket.level].include? @goal_level

      empty_destination_bucket if @destination_bucket.level == @destination_bucket.capacity
      fill_up_start_bucket if start_bucket.level.zero?
      break if check_level(@start_bucket)

      pour
    end
    @goal_bucket = @start_bucket.level == @goal_level ? @start_bucket.name : @destination_bucket.name
    @other_bucket = @goal_bucket == @start_bucket.name ? @destination_bucket.level : @start_bucket.level
  end

  def fill_up_start_bucket
    @start_bucket.fill_up
    increment_moves

  end

  def pour
    if @destination_bucket.capacity - @destination_bucket.level >= @start_bucket.level
      @destination_bucket.level += @start_bucket.level
      @start_bucket.empty
    else
      @start_bucket.level -= (@destination_bucket.capacity - @destination_bucket.level)
      @destination_bucket.level = @destination_bucket.capacity
    end
    increment_moves
  end

  def empty_destination_bucket
    @destination_bucket.empty
    increment_moves
  end

  def display_levels
    p "[#{@start_bucket.name}: #{@start_bucket.level}, #{destination_bucket.name}: #{destination_bucket.level}]"
  end

  def increment_moves
    @moves += 1
  end

  def check_level(bucket)
    bucket.level == @goal_level
  end
end

# Bucket definition
class Bucket
  attr_reader :name, :capacity
  attr_accessor :level
  def initialize(name, capacity)
    @name = name
    @capacity = capacity
    @level = 0
  end

  def fill_up
    @level = @capacity
  end

  def empty
    @level = 0
  end
end
