class CollatzConjecture
  def self.steps(n)
    raise ArgumentError unless n > 0

    step = 0

    while n != 1
      (n % 2).zero? ? n /= 2 : n = n * 3 + 1
      step += 1
    end

    step
  end
end

module BookKeeping
  VERSION = 1
end
