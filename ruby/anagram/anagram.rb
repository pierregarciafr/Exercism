class Anagram
  attr_reader :word_to_match, :word_letters, :word

  def initialize(word_to_match)
    @word = word.downcase
#-------
    # @word_to_match = word_to_match.downcase
    # @word_letters = @word.scan(/(\w)/).flatten.sort
  end

  def match(array)
    array.select do |w|
      w.downcase != @word && w.downcase.chars.sort == @word.chars.sort
    end
# #---------
#     # array[0].scan(/(\w)/).flatten.sort == word.sort
#     array.map do |expr|
#       expr if (expr.downcase.scan(/(\w)/).flatten.sort - @word_letters).empty? && @word_to_match != @w
#     end.compact



  end
end

p Anagram.new('master').match(["stream", "pigeon", "maters"])
p Anagram.new('LISTEN').match(["Listen", "Silent", "LISTEN"])
