class Triangle
  attr_reader :sides

  def initialize( [*side_one, side_two, side_three ] )
    @sides = [ side_one, side_two, side_three ].uniq.size
  end
end


if $PROGRAM_NAME == __FILE__
  puts Triangle.new([2,3,2]).sides
end

