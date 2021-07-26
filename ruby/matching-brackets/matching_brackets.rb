# frozen_string_literal: true

# '{[]}' -> (identify '[]', extract '[]', then identify '{}')


class Brackets

  private

  def initialize(string)
    @string = string
  end

  def process_pair_recognize_and_extract(expression)
    until expression.empty?

      pairs = recognize_complete_pairs(expression)
      return false if pairs.empty?

      expression = extract_found_pairs_from_string(pairs, expression)
    end
    true
  end

  def recognize_complete_pairs(expression_to_be_scanned)
    expression_to_be_scanned.scan(/(\[\])|(\{\})|(\(\))/).flatten.compact
  end

  def remove_all_non_bracket_characters
    @string.scan(%r{[^\s\w\+\.\/\*\-\\\^\&]}).join
  end

  def extract_found_pairs_from_string(array, expression)
    array.each { |pair| expression = expression.gsub(pair, '') }
    expression
  end

  public

  def self.paired?(string)
    new(string).paired?
  end

  def paired?
    process_pair_recognize_and_extract(
      remove_all_non_bracket_characters
    )
  end
end

if $PROGRAM_NAME == __FILE__
  p Brackets.paired?('[]')
end