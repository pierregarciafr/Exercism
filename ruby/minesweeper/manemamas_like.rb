# frozen_string_literal: true

# Board class
module Board
  class << self
    def transform(input)
      board = clean_format_in(input)
      mark_mines(board)
      # clean_format_out(board)
    end

    def clean_format_in(input)
      # guard_clauses
      make_board_array(input)
    end

    def make_board_array(input)
      input.map(&:chars)
    end

	def mark_mines(board)
  	  p mines = find_mines(board)
  	  mines.each do |mine|
        board = mark_mine(board, mine)
      end
  	end

  	# LES 3 MÉTHODES IMbriquees rendent un array de niveau 1 ( inject +) où ne figurent que les objets MINE
  	def find_mines(board)
  		board.each_index.inject([]) do |a1, row|
  			a1 + find_mines_in_row(board, row)
  		end
  	end

    def find_mines_in_row(board, row)
      board[row].each_index.inject([]) do |a2, col|
        a2 + (mine_at_position(board, row, col).to_a || [])
      end
    end

  	def mine_at_position(board, row, col)
  		board[row][col] == '*' ? Mine.new(row, col) : []
  	end

    def mark_mine(board, mine)
      mine.surrounding_areas.each do |pos|
        board[pos.y][pos.x] = increment(board[pos.y][pos.x])
      end
    end

    def increment(content)
      '+-*|'.include?(content.to_s) ? content : content.to_i += 1
    end
  end
end

class Mine
  attr_accessor :y, :x
  def initialize(y, x)
    @y = y
    @x = x
  end
  
  def to_a
  	[self]
  end

  # [-1, -1]
  def surrounding_areas(mine)
    [-1, 0, 1].repeated_permutation(2).inject([]) do |a, coords|
      p a << ( coords == [0, 0] ? [] : [Point.new(mine.y + coords.y, mine.x + coords.x)])
    end
  end



	# def surrounding_areas
	# 	[-1, 0, 1].repeated_permutation(2).inject([]) do |a, coords|
	# 		a + (coords == [0, 0] ? [] : [Point.new(x + coords[0], y + coords[1])])
	# 	end
	# end
	# def to_a
	# 	[self]
	# end
end

Point = Struct.new(:y, :x)


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
  Board.transform(inp)