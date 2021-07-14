module Hamming
  class << self
    def compute(string_1, string_2)
      raise(ArgumentError) if string_1.length != string_2.length

      string_to_array(string_1).zip(string_to_array(string_2)).count { |s1, s2| s1 != s2 }
    end

    def string_to_array(string)
      string.each_char.to_a
    end
  end
end
