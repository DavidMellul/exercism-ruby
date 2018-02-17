class Grains
  def self.square(n)
    raise ArgumentError if n > 64 || n <= 0
    # Faster without using ** operator
    2 << (n - 2)
  end

  def self.total
    # Faster without calling square function
    # Faster without using ** operator
    (1..64).reduce { |sum, i| sum + (2 << (i - 2)) }
  end
end

module BookKeeping
  VERSION = 1
end
