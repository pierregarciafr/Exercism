# frozen_string_literal: true

# Conversion d' 'une base a l'autre

  class BaseConverter

    private

    def initialize(input_base, digits, output_base)
      @input_base = input_base
      @digits = digits
      @output_base = output_base
    end

    def valid_arguments?
      raise ArgumentError if invalid_base?
      raise ArgumentError if invalid_digits?
    end

    def convert_to_decimal
      @digits.reverse.map.with_index do |n, i|
        n * (@input_base**i)
      end.sum
    end

    def decimal_to_output(result)
      array = result.zero? ? [0] : []

      until result.zero?
        array.unshift(result % @output_base)
        result /= @output_base
      end
      array
    end

    def invalid_base?
      @input_base < 2 || @output_base < 2
    end

    def invalid_digits?
      negative_digit? || value_out_of_base?
    end

    def negative_digit?
      !@digits.select(&:negative?).empty?
    end

    def value_out_of_base?
      !@digits.select { |n| n >= @input_base }.empty?
    end

    def convert
      valid_arguments?
      decimal_to_output(convert_to_decimal)
    end

    public

    def self.convert(input_base, digits, output_base)
      new(input_base, digits, output_base).send(:convert)
    end


  end

if $PROGRAM_NAME == __FILE__
    digits = [1, 0, 1]
    input_base = 2
    output_base = 10
    expected = [5]

    p BaseConverter.convert(input_base, digits, output_base)
end