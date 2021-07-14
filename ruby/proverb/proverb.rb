# frozen_string_literal: true

# create a proverb from a grouop of words
class Proverb
  def initialize(*args, qualifier: nil)
    @sentence = [*args].each_cons(2).map do |words|
      "For want of a #{words[0]} the #{words[1]} was lost."
    end
    qualifier += ' ' unless qualifier.nil?

    last_word = [*args].first
    @sentence << "And all for the want of a #{qualifier}#{last_word}."
  end

  def to_s
    @sentence.join("\n")
  end
end
