# frozen_string_literal: true

module Transpose
  class << self
    PAD = "\x00"

    def transpose(matrix)
      rows = parse_rows(matrix)
      rows = pad_and_split_rows(rows)
      columns = rows.transpose

      format_columns(columns)
    end

    private

    def parse_rows(matrix)
      matrix.lines(chomp: true)
    end

    def pad_and_split_rows(rows)
      row_size = row_size(rows)
      rows.map {|row| row.ljust(row_size, PAD).chars }
    end

    def row_size(rows)
      rows.map(&:size).max
    end

    def format_columns(columns)
      columns.map {|column| format_column(column) }.join("\n")
    end

    def format_column(column)
      p "column avant: #{column}"
      column = strip_right_pad(column.join)
      p "column après: #{column}"
      format_pad(column)
    end

    def strip_right_pad(padded)
      # p "padded avant: #{padded}"
      padded.sub(/#{PAD}+$/, "")
      # p "padded après: #{padded}"

    end

    def format_pad(padded)
      p "format pad"
      p padded.tr(PAD, " ")
    end
  end
end

# module Transpose
#   class << self
#     PAD = '\x00'
#     def transpose(string)
#       rows = parse_rows(string)
#       rows.max.length

#       rows = pad_and_split(rows)
#       p columns = rows.transpose

#       p format_columns(columns)
#     end

#     def parse_rows(str)
#       str.split("\n")

#     end

#     def pad_and_split(arr)
#       arr.map do |row|
#         row << "\x00" * (arr.max.length - row.length)
#         row.chars
#       end
#     end

#     def format_columns(cols)
#       cols.map { |col| format_column(col) } #col[-1]}.join.rstrip.chars
#     end

#     def format_column(column)
#       column = strip_right_pad(column.join)
#     end

#   end
# end
      # return string if string.empty?

# input = "Single line.\nERT"
#
input = "The fourth line.\nThe fifth line."
# input = "ABC\nDE"
# input = "AB\nDEF"
# input = "The longest line.\nA long line.\nA longer line.\nA line."
# input = "A1"
# input = "AB\n12"
p Transpose.transpose(input)


