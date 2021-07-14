# frozen_string_literal: true

class Robot
  DIRECTIONS = [:east, :south, :west, :north].freeze

  attr_reader :coordinates, :direction

  def orient(direction)
    raise ArgumentError unless DIRECTIONS.include?(direction)

    @direction = direction
  end

  def bearing
    @direction
  end

  def turn_right
    index = DIRECTIONS.index(@direction)
    index = (index + 1) % DIRECTIONS.size
    @direction = DIRECTIONS[index]
  end

  def turn_left
    index = DIRECTIONS.index(@direction)
    index = (index - 1) % DIRECTIONS.size
    @direction = DIRECTIONS[index]
  end

  def at(x, y)
    @coordinates = [x, y]
  end

  def advance
    x, y = @coordinates
    case @direction
    when :north
      y += 1
    when :east
      x += 1
    when :south
      y -= 1
    when :west
      x -= 1
    end
    at(x, y)
  end
end

class Simulator
  def place(robot, x:, y:, direction:)
    robot.at(x, y)
    robot.orient(direction)
  end

  def evaluate(robot, instructions_as_chars)
    instructions(instructions_as_chars).each do |i|
      robot.send i
    end
  end

  def instructions(instructions)
    instructions.chars.map do |instruction|
      case instruction
      when 'L'
        :turn_left
      when 'R'
        :turn_right
      when 'A'
        :advance
      end
    end
  end
end