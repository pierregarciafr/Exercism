class TwoBucket

  def initialize(max_one, max_two, result, start_bucket)
    @start_bucket = start_bucket
    @second_bucket = start_bucket == 'one' ? 'two' : 'one'
    @max_x = start_bucket == 'two' ? max_two : max_one
    @max_y = start_bucket == 'two' ? max_one : max_two
    @result = result
    @x = Array.new([0])
    @y = Array.new([0])

  end

  def moves
    # puts "#{[@x, @y]}"
    # until [@x.find_index(@result), @y.find_index(@result)].min
      sequence
      sequence
    # end

    [@x.find_index(@result), @y.find_index(@result)].min

  end

  def goal_bucket
    if [@x.find_index(@result), @y.find_index(@result)].min == @x.find_index(@result)
      @goal = @start_bucket
    else
      @goal = @second_bucket
    end

  end

  def other_bucket
    @goal = @start_bucket ? @second_bucket : @start_bucket
  end

  def sequence

    # segment horizontal 1
    fill_bucket_x if @x.last == 0 # pas de goal test

    # @moves = @x.zip(@y).length
    # puts "#{@moves}"


    until @x.last <= 0

      # segment oblique pente -1
      pour_bucket_x_into_y

        # puts "#{[@x, @y]}"
        # puts  @x.zip(@y)
        puts (@x.last || @y.last) == @result

        # return @x.zip(@y) if (@x.last || @y.last) == @result
      # segment vertical : empty bucket y

      empty_bucket_y if @y.last == @max_y

    end

    puts "#{@x.zip(@y).last}"
    puts "------------------"
  end

  def goal_reached?
    # @x.find_index(@result) || @y.find_index(@result)
  end

  def fill_bucket_x
      @x << @max_x
      @y << @y.last
  end

  def pour_bucket_x_into_y
    # if @x.last >= @max_y
    @x << @x.last - @max_x # + @y.last
    @y << @y.last + @max_x


# TODO compléter ce cas
    if @x.last < 0
      puts "verif"
      delta = @x.last
      @y[-1] += @x.last
      @x[-1] = 0

    elsif @y.last > @max_y

      delta = @y.last - @max_y
      @x[-1] += delta
      @y[-1] = @max_y
    end
    puts "#{@x.zip(@y)}"
  end

  def empty_bucket_y
      @x << @x.last
      @y << 0
  end

end

subject = TwoBucket.new(3, 5, 1, 'two')
puts "#{subject.moves}"
puts "#{subject.goal_bucket}"
puts "#{subject.other_bucket}"
# puts subject.goal_bucket
