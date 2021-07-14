class Scrabble
  TILE = { A: 1, N: 1,
           B: 3, O: 1,
           C: 3, P: 3,
           D: 2, Q: 10,
           E: 1, R: 1,
           F: 4, S: 1,
           G: 2, T: 1,
           H: 4, U: 1,
           I: 1, V: 4,
           J: 8, W: 4,
           K: 5, X: 8,
           L: 1, Y: 4,
           M: 1, Z: 10 }

  def self.score(tiles)
    new(tiles).score
  end

  private

  def initialize(letters_set, tile_set = TILE)
    @tile_set = tile_set
    @tiles = normalize(letters_set)
    @score = @tiles.collect { |tile_count| tile_count[0][1] * tile_count[1] }.sum
  end

  def normalize(word)
    valid_letters = word.to_s.upcase.scan(/[A-Z]/).sort!

    @tile_set.each_with_object({}) do |tile, h|
      h[tile] = valid_letters.include?(tile[0].to_s) ? valid_letters.count { |x| x == tile[0].to_s } : 0
    end
  end

  public

  attr_reader :score
end

if $PROGRAM_NAME == __FILE__
  Hawaiian_Tiles = {
    A: 1, N: 3,
    O: 2,
    P: 8,
    E: 4,
    H: 6, U: 5,
    I: 3,
    W: 9,
    K: 2,
    L: 7,
    M: 8
  }
  hawaiian = Hawaiian_Tiles
  puts Scrabble.new('street').score
  puts Scrabble.new('Humuhumunukunukuapuaa', Hawaiian_Tiles).score
  puts Scrabble.new('hello').score # 8
  puts Scrabble.new('aloha', tile_set = hawaiian).score # 15
  puts Scrabble.new("he‘e", hawaiian).score # => 14
end
