# frozen_string_literal: true

# scale
class Scale
  CHROMATIC_SCALE = {
    sharps: %w[A A# B C C# D D# E F F# G G#],
    flats: %w[Ab A Bb B C Db D Eb E F Gb G]
  }.freeze

  TONIC = {
    sharps: %w[C G D A E B F# a e b f# c# g# d#],
    flats: %w[F Bb Eb Ab Db Gb d g c f bb eb]
  }.freeze

  STEPS = {
    'm' => 1,
    'M' => 2,
    'A' => 3
  }.freeze

  def initialize(tonic, mode, pattern = 'm' * 12)
    @tonic = tonic
    @mode = mode
    @pattern = pattern
  end

  def name
    "#{@tonic.upcase} #{@mode}"
  end

  def pitches
    ind = scale.index(@tonic.capitalize)
    chromatic = scale.rotate(ind)
    i = 0
    @pattern.chars[0...-1].each_with_object([chromatic[i]]) do |m, a|
      i += STEPS[m]
      a << chromatic[i]
    end
  end

  def scale
    result = TONIC.select do |key, val|
      val.include? @tonic
    end
    CHROMATIC_SCALE[*result.keys]
  end
end

