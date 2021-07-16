class Scrabble
  TILES = { A: 1, N: 1,
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

  def initialize(letters_set, tiles = TILES)
    @letters_set = letters_set.to_s.upcase.scan(/[A-Z]/).sort!
    @tiles = tiles
    @tiles_count = normalize
    @score = compute_score
  end

  def normalize
    @tiles.each_with_object({}) do |(key, _), h|
      h[[key, _]] = @letters_set.include?(key.to_s) ? @letters_set.count { |x| x == key.to_s } : 0
    end
  end

  def compute_score
    @tiles_count.each_pair.collect { |(_, value), count| value * count }.sum
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
  puts Scrabble.new('aloha', tiles = hawaiian).score # 15
  puts Scrabble.new("he‘e", hawaiian).score # => 14
end
