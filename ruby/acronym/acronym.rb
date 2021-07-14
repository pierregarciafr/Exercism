class Acronym

  def self.abbreviate(sentence)
    sentence.split(/[\s-]+/).map {|word| word[0].upcase}.join
  end
end

