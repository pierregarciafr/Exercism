class Nucleotide
  NUCLEOTIDES = %w[A T C G]

  def initialize(string)
    raise(ArgumentError) unless (string.chars.uniq - NUCLEOTIDES).empty?

    @string = string
  end

  def self.from_dna(string)
    new(string)
  end

  def count(char)
    @string.count(char)
  end

  def histogram
    NUCLEOTIDES.each_with_object(Hash.new(0)) do |char, obj|
      obj[char] = @string.count(char)
    end
  end
end
