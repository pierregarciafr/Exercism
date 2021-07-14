# frozen_string_literal: true
SOUNDS = {
          3 => 'Pling',
          5 => 'Plang',
          7 => 'Plong'
        }.freeze

class Raindrops
  def self.convert(number)
    result = SOUNDS.select { |key, value| (number % key).zero? }
    result.empty? ? number.to_s : result.values.join
  end
end


