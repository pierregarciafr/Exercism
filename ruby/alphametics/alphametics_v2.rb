# frozen_string_literal: true

# alphametics
module Alphametics
  class << self
    def solve(string)
      letter_hash = {}
      p parsed = {
        operators: string.scan(/([+|[==]+])/).flatten,
        values: string.scan(/([A-Z]+)/).flatten[0..-2],
        result: string.scan(/([A-Z]+)/).flatten[-1],
        letters: string.scan(/([A-Z]+)/).flatten.join.split('').uniq,
        nozero: string.scan(/([A-Z]+)/).flatten.map { |expr| expr[0] }
      }
      return {} unless parsed[:operators].include?('+')
      return {} unless parsed[:values].reject { |value| value.length <= parsed[:result].length }.empty?

      # -------- report case
      if parsed[:values].reject { |value| value.length < parsed[:result].length }.empty?
        letter_hash[parsed[:result][0]] = 1
        parsed[:letters] = parsed[:letters] - [*parsed[:result][0]]

      end
      p parsed
      letter_hash
    end

    # creer un grid
    # |   |   | 1 |
    # |   | B | B |
    # --------------
    # | 1 | L | L |

    # la lecture des colonnes là où il y a I / integer donne : L = B + 1
    # L = B + 1 et B E [1..9] et B != I donc
    # =>  B E [2..8] et L = B + 1

  end
end

puzzle = 'I + BB == ILL'
# puzzle = 'A == B'
#puzzle = 'ACA + DD == BD'

p Alphametics.solve(puzzle)
