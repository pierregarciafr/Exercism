module Board
  MINE = "*"
  BORDER = 1
  TOP_BOTTOM = /\+\-+\+/
  SIDE = "|"

  def self.transform(board)
    raise ArgumentError if not_rectangle?(board) || faulty_border?(board) || invalid_chars?(board)
    board = board.map(&:chars)
    p board
    board.each_with_index do |row, x|
      row.index_all(MINE)
         .each { |y| number_around(x, y, board) }
    end
    board.map(&:join)
  end

  def self.number_around(mine_x, mine_y, board)
    (mine_x-1..mine_x+1).each do |x|
      next if on_border?(x, board)
      (mine_y-1..mine_y+1).each do |y|
        next if on_border?(y, board[0])
        number_at(x, y, board)
      end
    end
  end

  def self.number_at(x, y, board)
    board[x][y] = board[x][y].to_i + 1 unless board[x][y] == MINE
  end

  def self.on_border?(pos, dimension)
    [BORDER - 1, dimension.length - BORDER].include? pos
  end

  def self.not_rectangle?(board)
    board.select { |row| row.size != board[0].size }.any?
  end

  def self.faulty_border?(board)
    not [board.first.match?(TOP_BOTTOM),
         board.last.match?(TOP_BOTTOM),
         board[1..-2].all? { |row| row[0] == SIDE && row[-1] == SIDE }].all?
  end

  def self.invalid_chars?(board)
    not board[1..-2].all? do |line|
      line.match?(/^.[\d\* ]+.$/)
    end
  end
end


class Array
  def index_all(obj = nil)
    if obj || block_given?
      proc = obj ? ->(i) { self[i] == obj } : ->(i) { yield self[i] }
      self.each_index.select(&proc)
    else
      self.each
    end
  end
end
