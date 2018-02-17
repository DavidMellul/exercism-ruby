class SpaceAge
  BASE_ORBITAL_PERIOD = 365.25

  DAY_SECONDS = 86400

  RATIOS = {
      Earth: 1,
      Mercury:  0.2408467,
      Venus: 0.61519726,
      Mars: 1.8808158,
      Jupiter: 11.862615,
      Saturn: 29.447498,
      Uranus: 84.016846,
      Neptune: 164.79132
  }

  def initialize(seconds)
    @s = seconds
  end

  RATIOS.each_key do |planet|
    define_method("on_#{planet.downcase}") do
      @s/(RATIOS[planet] * DAY_SECONDS * BASE_ORBITAL_PERIOD)
    end
  end

end

module BookKeeping
  VERSION = 1
end