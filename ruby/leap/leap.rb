class Year
  def self.leap?(year)
    # filters multiples of 4
    return false if !(year % 4).zero?
    # returns false when the number is multiple of 100 and not a 400 multiple
    (year % 100).zero? && !(year % 400).zero? ? false : true
  end
end


