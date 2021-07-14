class Microwave

  def initialize(time)
    @time = time
  end

  def timer
    mn, s = time.divmod 60 if time <= 90
    mn, s = time.divmod 100 if time >= 100

    '%02d:%02d' % [mn, s]
  end

  private

  attr_reader :time
end
