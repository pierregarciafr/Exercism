# frozen_string_literal: true

# tonic + set of intervals
class Scale
  INTERVALS = { 'M' => 2, 'm' => 1, 'A' => 3 }.freeze
  PITCHES = { 1 => 'A', 2 => { sharp: 'A#', flat: 'Bb' },
              3 => 'B',
              4 => 'C', 5 => { sharp: 'C#', flat: 'Db' },
              6 => 'D', 7 => { sharp: 'D#', flat: 'Eb' },
              8 => 'E',
              9 => 'F', 10 => { sharp: 'F#', flat: 'Gb' },
              11 => 'G', 12 => { sharp: 'G#', flat: 'Ab' } }.freeze
  USE_FLATS = %w[F Bb Eb Ab Db Gb d g c f bb eb].freeze

  attr_reader :chromatic

  def initialize(tonic, mode, pattern = 'm' * 12)
    @tonic = tonic
    @mode = mode
    @pattern = pattern
  end

  def name
    "#{@tonic.upcase} #{@mode}"
  end

  def pitches
    transposed_chromatic = generate_transposed_chromatic
    select_degrees.map do |value|
      transposed_chromatic[value]
    end[0...-1]
  end

  private

  def generate_transposed_chromatic
    chromatic_scale = choose_alterations(check_sharp_or_flat_alterations)
    transpose(chromatic_scale)
  end

  def check_sharp_or_flat_alterations
    return :flat if USE_FLATS.include?(@tonic)

    :sharp
  end

  def transpose(scale)
    index = scale.index(@tonic.capitalize)
    scale.rotate(index)
  end

  def select_degrees
    array_of_intervals = convert_pattern_to_array_of_intervals
    create_array_of_degrees(array_of_intervals)
  end

  def convert_pattern_to_array_of_intervals
    @pattern.chars.map { |m| INTERVALS[m] }
  end

  def create_array_of_degrees(array_of_intervals)
    array_of_intervals.each_index.inject([0]) do |arr, index|
      arr << sum_of(array_of_intervals.take(index + 1))
    end
  end

  def sum_of(array)
    array.sum
  end

  def choose_alterations(alterations)
    PITCHES.map do |key, val|
      [2, 5, 7, 10, 12].include?(key) ? val[alterations] : val
    end.compact
  end
end

chromatic = Scale.new('bb', :minor, 'MmMMmMM')
p chromatic.pitches
