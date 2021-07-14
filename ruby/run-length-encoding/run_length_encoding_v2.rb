class RunLengthEncoding
  def self.encode(input)
    output = []
    # "XXYX" -> [["XX"], ["Y"], ["X"]]
    input.chars.each do |char|
      if output.last && output.last[0] == char
        output.last << char
      else
        output << [char]
      end
    end
    # [["XX"], ["Y"], ["X"]] -> ["2X", "Y", "Z"]
    output.map { |arr| "#{arr.length.to_s if arr.length > 1}#{arr[0]}" }.join
  end

  def self.decode(input)
    # "2XYX" -> [["2","X"], ["Y"], ["X"]]
      input.scan(/(\d*)([ \w])/).map do |group|
        group[1] * (group[0].empty? ? 1 : group[0].to_i)
      end.join
  end
end
