class ResistorColorTrio
  attr_accessor :unit, :value
  COLORS = %w[black brown red orange yellow green blue violet grey white]

  def initialize(colors)
    raise(ArgumentError) unless colors.all?{|color| COLORS.include?(color)}

    @colors = colors
  end

  def value_of(color)
    COLORS.index(color)
  end

  def calculate_resistance
    @resistance = (value_of(@colors[0])*10 + value_of(@colors[1])) * (10**value_of(@colors[2]))
    convert_resistance(@resistance) if @resistance >= 1000
  end

  def convert_resistance(resistance)
    @resistance = resistance / 1000
    @prefix = 'kilo'
  end

  def label
    calculate_resistance
    "Resistor value: #{@resistance} #{@prefix}ohms"
  end
end
