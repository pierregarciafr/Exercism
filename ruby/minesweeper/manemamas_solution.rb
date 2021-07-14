# Adds points to a minesweeper board
class Board
  def self.transform(input)
    board = clean_format_in(input)
    board = mark_mines(board)
    clean_format_out(board)
  end

  def self.clean_format_in(input)
    fail ValueError, 'Different length rows' unless all_same_len?(input)
    fail ValueError, 'Invalid characters' unless all_valid_chars?(input)
    fail ValueError, 'Faulty border' unless all_borders_ok?(input)
    make_board_array(input)
  end

  def self.clean_format_out(board)
    board.map(&:join)
  end

  def self.all_same_len?(input)
    input.all? { |i| i.size == input[0].size }
  end

  def self.all_valid_chars?(input)
    !(input.join =~ /[^\+\-\|\*\s]/)
  end

  def self.all_borders_ok?(input)
    top_and_bottom_ok?(input) && sides_ok?(input)
  end

  def self.sides_ok?(input)
    input[1...-1].all? do |i|
      i[0] == '|' && i[-1] == '|'
    end
  end

  def self.top_and_bottom_ok?(input)
    edge_regex = /^\+\-*\+$/
    input[0] =~ edge_regex && input[-1] =~ edge_regex
  end

  def self.make_board_array(input)
    input.map(&:chars)
  end

  def self.find_mines(board)
    board.each_index.inject([]) do |a1, row|
      a1 + find_mines_in_row(board, row)
    end
  end

  def self.find_mines_in_row(board, row)
    board[row].each_index.inject([]) do |a2, col|
      a2 + (mine_at_position(board, row, col).to_a || [])
    end
  end

  def self.mine_at_position(board, row, col)
    Mine.new(row, col) if board[row][col] == '*'
  end

  def self.mark_mines(board)
    mines = find_mines(board)
    mines.each do |mine|
      board = mark_mine(board, mine)
    end
    board
  end

  def self.mark_mine(board, mine)
    mine.surrounding_areas.each do |pos|
      board[pos.x][pos.y] = increment(board[pos.x][pos.y])
    end
    board
  end

  def self.increment(elem)
    '+-*|'.include?(elem.to_s) ? elem : elem.to_i + 1
  end
end

# Define an individual mine
class Mine
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def surrounding_areas
    [-1, 0, 1].repeated_permutation(2).inject([]) do |a, i|
      a + (i == [0, 0] ? [] : [Point.new(x + i[0], y + i[1])])
    end
  end

  def to_a
    [self]
  end
end

# Individual point coordinates
Point = Struct.new(:x, :y)

# Error Class
class ValueError < ArgumentError
end
