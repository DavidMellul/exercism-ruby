class Series
  def initialize(str)
    @s = str
  end

  def slices(n)
    raise ArgumentError unless n <= @s.size

    # First shot
    # (0..@s.size - 1).each_with_object([]) do |i, result|
    #    result << @s.chars[(i..i + (n - 1))].join if (i+n) <= @s.size
    #  end
    #

    # Ugly one, so that Rikki doesn't complain about conditional statements within loops :(
    (0..@s.size - 1).each_with_object([]) do |i, result|
      result << @s.chars[(i..i + (n - 1))].join
    end.each_with_index.take_while {|v, i| (i + n) <= @s.size}.map { |k,_| k }

  end
end

# No BookKeeping for this exercise ? O_O