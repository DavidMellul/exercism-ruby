class Raindrops
  RAIN_DROPS = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def self.convert(n)
    converted = RAIN_DROPS.select { |k, _| (n % k).zero? }
    converted.empty? ? n.to_s : converted.values.join
  end
end

module BookKeeping
  VERSION = 3
end
