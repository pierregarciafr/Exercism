# fronzen
module RunLengthEncoding
  def self.encode(string)
    string.gsub(/(.)\1+/) { |s| "#{s.length}#{s[0]}" }
  end

  def self.decode(string) #12WB12W3B24WB
    string.gsub(/(\d+)([ \w])/) { $2 * $1.to_i}
  end
end
