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
    def transform(array_input)
      error_raised?(array_input)

      p @work_array = create_work_matrix(array_input)

      first_line = array_input[0]
      last_line = array_input[-1]

      mine_locations = generate_mines_coords(@work_array)
      fill_numbers_in_matrix(@work_array, mine_locations)

      @work_array
        .map do |line|
          "|#{line.join.gsub('0', ' ')}|"
        end
        .unshift(first_line)
        .push(last_line)
    end

    # substitue les espaces par des 0
    # explose les lignes en autant de cases/caracteres isoles
    def create_work_matrix(array)
      array[1..-2].each_with_object([]) do |line, arr|
        line.gsub!(/\s/, '0')
        arr << line[1..-2].chars
      end.to_a
    end

    def generate_mines_coords(array)
      locations = []
      array.each_with_index do |this_row, row|
        this_row.each_with_index do |cell, col|
          locations << [col, row] if cell == '*'
        end
      end
      locations
    end

    def fill_numbers_in_matrix(array, array_of_locations)
      y_max = array.length - 1
      x_max = array[0].length - 1

      array_of_locations.each do |x, y|
        increment_cell_if_has_a_digit_value(x - 1, y) if x.positive?
        increment_cell_if_has_a_digit_value(x + 1, y) if x < x_max
        increment_cell_if_has_a_digit_value(x, y - 1) if y.positive?
        increment_cell_if_has_a_digit_value(x, y + 1) if y < y_max
        increment_cell_if_has_a_digit_value(x - 1, y - 1) if x.positive? && y.positive?
        increment_cell_if_has_a_digit_value(x + 1, y - 1) if x < x_max && y.positive?
        increment_cell_if_has_a_digit_value(x - 1, y + 1) if x.positive? && y < y_max
        increment_cell_if_has_a_digit_value(x + 1, y + 1) if x < x_max && y < y_max
      end
    end

    private

    def increment_cell_if_has_a_digit_value(x, y)
      @work_array[y][x] = (@work_array[y][x].to_i + 1).to_s if /\d/.match(@work_array[y][x])
    end

    def error_raised?(array)
      raise ArgumentError.new('array has different lengths') if different_lengths?(array)

      raise ArgumentError.new('array has faulty borders') if faulty_border?(array)

      raise ArgumentError.new('array has invalid characters') if invalid_chars?(array)
    end

    def faulty_border?(array)
      result = array.map.with_index do |line, i|
        if i == 0 || i == (array.length - 1)
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


