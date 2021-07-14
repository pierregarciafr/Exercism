class Phrase
  def initialize(words)
    @words = words
  end

  def word_count
    @words.scan(/\b\w+[']*\w*\b/)
          .each_with_object(Hash.new(0)) do |word, obj|
      obj[word.downcase] += 1
    end
  end
end
