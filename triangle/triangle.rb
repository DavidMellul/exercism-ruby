class Triangle
  def initialize(sizes)
    @a, @b, @c = *sizes
  end

  def equilateral?
    valid? && @a == @b && @b == @c
  end

  def isosceles?
    valid? && (@a == @b || @a == @c || @b == @c)
  end

  def scalene?
    valid? && @a != @b && @a != @c && @b != @c
  end

  def valid?
    @a > 0 && @b > 0 && @c > 0 && (@a + @b >= @c && @b + @c >= @a)
  end
end

module BookKeeping
  VERSION = 1
end
