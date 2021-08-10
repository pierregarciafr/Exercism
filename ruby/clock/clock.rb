class Clock
  attr_reader :hour, :minute

  private

  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def convert_to_seconds
    (@hour * 60 + @minute) * 60
  end

  public

  def to_s
    Time.at(convert_to_seconds).utc.strftime('%H:%M')
  end

  def +(other)
    total_hour = @hour + other.hour
    total_minute = @minute + other.minute
    Clock.new(hour: total_hour, minute: total_minute)
  end

  def -(other)
    total_hour = @hour - other.hour
    total_minute = @minute - other.minute
    Clock.new(hour: total_hour, minute: total_minute)
  end

  def ==(other)
    first_time = @hour * 60 + minute
    second_time = other.hour * 60 + other.minute
    first_time % 1440 == second_time % 1440
  end
end

if $PROGRAM_NAME == __FILE__
  clock1 = Clock.new(hour: 24, minute: 00)
  clock2 = Clock.new(hour: 0, minute: 0)
  p clock1 == clock2
end