# frozen_string_literal: true

# '{[]}' -> (identify '[]', extract '[]', then identify '{}')
module Brackets
  class << self
    def paired?(string)
      process_pair_recognize_and_extract(
        remove_all_non_bracket_characters(string)
      )
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

    def remove_all_non_bracket_characters(expr)
      expr.scan(%r{[^\s\w\+\.\/\*\-\\\^\&]}).join
    end

    def extract_found_pairs_from_string(array, expression)
      array.each { |pair| expression = expression.gsub(pair, '') }
      expression
    end
  end
end
