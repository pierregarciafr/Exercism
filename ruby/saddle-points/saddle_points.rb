class Matrix
  attr_reader :rows, :columns

  def initialize(string)
    @rows = string
              .split("\n")
              .map do|line|
                      line.split(" ")
                          .map(&:to_i)
                   end
    @columns = @rows.transpose
  end

  def saddle_points
    rows.each_with_index.map do |row, y|
      row.each_with_index.collect do |elmt, x|
        [y, x] if elmt == row.max && elmt == columns[x].min
      end
    end
    .flatten(1)
    .compact
  end
end
