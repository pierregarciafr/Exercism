class SpaceAge
  YEAR_IN_SECONDS = 31_557_600.0
  PERIOD = { earth: 1,
             mercury: 0.2408467,
             venus: 0.61519726,
             mars: 1.8808158,
             jupiter: 11.862615,
             saturn: 29.447498,
             uranus: 84.016846,
             neptune: 164.79132
            }

  def initialize(seconds)
    @seconds = seconds
  end

  PERIOD.each do |planet, year|
    define_method("on_#{planet}") do
      (@seconds / (YEAR_IN_SECONDS * year)).round(2)
    end
  end
end
