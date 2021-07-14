# frozen_string_literal: true

# alphametics
module Alphametics
  class << self
    def solve(string)
      array_of_strings = string.scan(/([A-Z]+)/).flatten
      values = []
      hash = {}
      letters = single_letters_array(array_of_strings)
      (0..9).to_a.each do |nb1|
        hash[letters[0]] = nb1
        (0..9).to_a.each do |nb2|
          next if nb2 == nb1
          hash[letters[1]] = nb2
          (0..9).each do |nb3|
            next if nb3 == nb2 || nb3 == nb1

            hash[letters[2]] = nb3
            values[0] = array_of_strings[0].split('').map { |letter| hash[letter] }.join.to_i
            values[1] = array_of_strings[1].split('').map { |letter| hash[letter] }.join.to_i
            values[2] = array_of_strings[2].split('').map { |letter| hash[letter] }.join.to_i
            break if values[0] + values[1] == values[-1]
          end
          break if values[0] + values[1] == values[-1]
        end
        break if values[0] + values[1] == values[-1]
      end
      hash
    end

    def single_letters_array(array)
      array.map { |string| string.chars }.flatten.uniq
    end

    def create_hash(array)
      letters = array.map { |string| string.chars }.flatten.uniq

      hash = {}
      letters.each { |a| hash[a] = 1 }
      hash
    end

  end
end

puzzle = 'I + BB == ILL'
p Alphametics.solve(puzzle)

