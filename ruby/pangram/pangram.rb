require 'Set'
class Pangram
  def self.pangram?(sentence)

    Set[*sentence.downcase.scan(/[a-z]/)].length == 26
    # ([*'a'..'z'] - sentence.downcase.chars.uniq).empty?
  end
end

p Pangram.pangram?('the quick brown fox jumps over the lazy dog')
