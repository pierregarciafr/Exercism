# frozen_string_literal: true

# Conversion d' 'une base a l'autre
module BaseConverter
  class << self
    def convert(input_base, digits, output_base)
      valid_arguments?(input_base, digits, output_base)
      result = convert_to_decimal(input_base, digits)
      decimal_to_output(output_base, result)
    end

    private

    def valid_arguments?(input_base, digits, output_base)
      raise ArgumentError if invalid_base?(input_base, output_base)
      raise ArgumentError if invalid_digits?(digits, input_base)
    end

    def convert_to_decimal(input_base, digits)
      digits.reverse.map.with_index do |n, i|
        n * (input_base**i)
      end.sum
    end

    def decimal_to_output(output_base, result)
      array = result.zero? ? [0] : []

      until result.zero?
        array.unshift(result % output_base)
        result /= output_base
      end
      array
    end

    def invalid_base?(input_base, output_base)
      input_base < 2 || output_base < 2
    end

    def invalid_digits?(digits, input_base)
      negative_digit?(digits) || value_out_of_base?(digits, input_base)
    end

    def negative_digit?(digits)
      !digits.select(&:negative?).empty?
    end

    def value_out_of_base?(digits, input_base)
      !digits.select { |n| n >= input_base }.empty?
    end
  end
end
