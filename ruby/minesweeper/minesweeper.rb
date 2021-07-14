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
module Board
  class << self
    MINE = '*'
    BORDER_VERTICAL = '|'
    BORDER_HORIZONTAL = '-'
    BORDER_CORNER = '+'
    EMPTY_SPACE = ' '

    def transform(array_input)
      error_raised?(array_input)

      @work_array = array_input.map(&:chars) # { |x| x = 0 if x==' '}
      # p @work_array = create_work_matrix(array_input)

      @work_array.each_with_index do |line, y|
        line.each_with_index do |char, x|
          # fill_numbers(x, y) if char == '*'
          Mine.new(x, y) if char == '*'
        end
        p line
      end
    end

    def error_raised?(array)
      raise ArgumentError.new('Array Format Error') if
                                              different_lengths?(array) ||
                                              faulty_border?(array) ||
                                              invalid_chars?(array)
    end

    def faulty_border?(array)
      result = array.map.with_index do |line, i|
        if i.zero? || i == (array.length - 1)
          line == line.scan(/^\+\-+\+$/).join
        else
          "#{line[0]}#{line[-1]}" == '||'
        end
      end
      result.uniq.include?(false)
    end

    def invalid_chars?(array)
      array[1..-2].map do |line|
        !/[^\s\*]+/.match(line[1..-2]).nil?
      end.include?(true)
    end

    def different_lengths?(array)
      array.map(&:length).uniq.size > 1
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
       
        # p "de #{ancient_value} à #{@work_array[yy][xx]}"
end

Point = Struct.new(:x, :y)


# Error Class
# class Exception < ArgumentError
# end

# class ArgumentError
# end

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


