class ArmstrongNumbers

  def self.include?(number)
    arr = number.digits
    number == arr.sum { |n| n**arr.count }
  end
end
