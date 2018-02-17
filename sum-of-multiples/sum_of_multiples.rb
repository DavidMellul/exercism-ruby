class SumOfMultiples
  def initialize(*divisors)
    @d = divisors
  end

  def to(n)
    @d.flat_map { |divisor| (0...n).step(divisor).to_a }.uniq.sum
  end
end

module BookKeeping
  VERSION = 2
end
