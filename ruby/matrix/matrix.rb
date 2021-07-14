# frozen_string_literal: true

class Matrix
  attr_reader :rows, :columns

  def initialize(string)
    @rows = string.split("\n").map { |str| str.split.map(&:to_i) }
          # string.scan(/\b(.+)\b/)
    @columns = @rows.transpose
  end

  # def columns
  #   @rows.transpose
  # end
end

