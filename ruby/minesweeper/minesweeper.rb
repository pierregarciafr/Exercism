# frozen_string_literal: false

# Creer Exception Class

# ['+------+',
#  '| *  * |',
#  '|  *   |',
#  '|    * |',
#  '|   * *|',
#  '| *  * |',
#  '|      |',
#  '+------+' ]


class Board

    MINE = '*'
    BORDER_VERTICAL = '|'
    BORDER_HORIZONTAL = '-'
    BORDER_CORNER = '+'
    EMPTY_SPACE = ' '

  private

  def initialize(array_input)
    @array_input = array_input
  end

  def error_raised?
    raise ArgumentError.new('Array Format Error') if
                                            different_lengths? ||
                                            faulty_border? ||
                                            invalid_chars?
  end

  def faulty_border?
    result = @array_input.map.with_index do |line, i|
      if i.zero? || i == (@array_input.length - 1)
        line == line.scan(/^\+\-+\+$/).join
      else
        "#{line[0]}#{line[-1]}" == '||'
      end
    end
    result.uniq.include?(false)
  end

  def invalid_chars?
    @array_input[1..-2].map do |line|
      !/[^\s\*]+/.match(line[1..-2]).nil?
    end.include?(true)
  end

  def different_lengths?
    @array_input.map(&:length).uniq.size > 1
  end


  public

  def self.transform(array_input)
    new(array_input).transform
  end

  def transform
    error_raised?

    @array_input.map(&:chars).each_with_index do |line, y|
      line.each_with_index do |char, x|
        # fill_numbers(x, y) if char == '*'
        Mine.new(x, y) if char == '*'
      end
      p line
    end
  end

end

class Mine
  def initialize(mine_x, mine_y)
    @mine_x = mine_x
    @mine_y = mine_y
  end

  def surroundings
    [-1, 0, 1].repeated_permutation(2).inject([]) do |a, i|
    if i == [0, 0]
      a
    else
      a << [Point.new(mine_x + i[0], mine_y + i[1])]
    end
  end
end

Point = Struct.new(:x, :y)


  inp = ['+------+', '| *  * |', '|  *   |', '|    * |', '|   * *|',
             '| *  * |', '|      |', '+------+']
  out = ['+------+',
         '|1*22*1|',
         '|12*322|',
         '| 123*2|',
         '|112*4*|',
         '|1*22*2|',
         '|111111|',
         '+------+']
  p Board.transform(inp)


