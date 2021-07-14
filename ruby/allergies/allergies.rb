# frozen_string_literal: true

# class_comment
class Allergies
  ITEMS = %w[
    eggs
    peanuts
    shellfish
    strawberries
    tomatoes
    chocolate
    pollen
    cats
  ].freeze

  def initialize(value)
    @value = value
  end

  def allergic_to?(item)
    list.include?(item)
  end

  def list
    select_items_from_binary_seq(convert_value_to_binary_array(@value))
  end

  private

  attr_reader :value

  def convert_value_to_binary_array(number)
    number.to_s(2).rjust(8, '0').reverse.chars
  end

  def select_items_from_binary_seq(binary_array)
    ITEMS.select.with_index do |item, i|
      item if binary_array[i].to_i == 1
    end
  end
end
