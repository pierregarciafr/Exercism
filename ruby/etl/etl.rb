# frozen_string_literal: true
class ETL
  def self.transform(old)
    old.map.each_with_object({}) do |key, obj|
      key[1].each { |letter| obj[letter.downcase] = key[0] }
    end
  end
end
