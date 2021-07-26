# frozen_string_literal: true

# Neme nombre premier

class Prime

  def initialize(integer)
    @integer = integer
  end

  public

  def nth
    raise(ArgumentError) unless @integer.positive?

    premiers = [2]
    number = 2
    until premiers.length == @integer
      number += 1
      multiples = premiers.select { |premier| (number % premier).zero? }
      premiers << number if multiples.empty?
    end
    premiers.max
  end
  
  def self.nth(integer)
    new(integer).nth
  end
end

if $PROGRAM_NAME == __FILE__
   p Prime.nth(10001) # 104743,
end