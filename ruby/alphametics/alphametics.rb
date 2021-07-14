#frozen_string_literal: true

# Isoler les 3 blocs de lettres Regex
# les inverser pour que unites --> index 0
# crée un hash avec les lettres
# cree un array avec les lettres :
# | I |   |   |
# | B | B |   |
# -------------
# | L | L | I |

# I + B = L (+ 10)
# B = L - 1
# commence avec la ligne a l'indice le plus élevé -> valeur 1

# @values = [ I , ["B","B"] ]
#             I , B + 10 * B
# @result = [ LLI ] L + 10 * L + 100 * I

# si LLI.size > @values.each.length
#   result[last] = 1
# end

# I = 1
# L = B + 1
# BB + 1 = ILL

# 6 + 5 = 11
# A + B = CC C = 1 => CC = 11 => [A,B] [8,3][9,2][4,7]

module Alphametics
  class << self
    attr_reader :array_of_keys, :operandes
    def solve(puzzle)
      p operandes = puzzle.scan(/(\w*)/).flatten.collect{|x| x.reverse if !x.empty?}.compact

      h = Hash.new(0)
      p @array_of_keys = operandes.join.chars.uniq.sort
      p @h = array_of_keys.to_h { |x| [ x, 0]}

      check_form
      # check result.length >= operands.length
      # Si result[-1] est le seul index a avoir une valeur,
      #   cette lettre = 1. On actualise le tableau, et on passe à la colonne suivante
      # Sinon,
      #   on a trois possibilités :
      #     1.   2.   3.
      #   |   ||   || A |
      #   | B || B || B |
      #   ----------------
      #   | B || C || C |

      # 1. on sait pas
      # 2. C = B + 1 : on actualise le tableau
      # 3. A + B = C => 1 + 2 = 3 ; 1 + 3 = 4  ... 4 + 5 = 9



    end

    def method_name
      identify_result_and_operandes
      check_sum_is_valid # check result.length >= operandes.length
      # --> { result :  , operands: []}
    end
    def identify_highest_number
      # if @array_of_keys =
      @result = @operandes[-1].chars
      @value1 = @operandes[0].chars
      @value2 = @operandes[1].chars
    end
  end
end

puzzle = 'I + BB == ILL'
Alphametics.solve(puzzle)
