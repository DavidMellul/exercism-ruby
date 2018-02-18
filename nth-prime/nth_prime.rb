class Prime
  def self.nth(n)
    raise ArgumentError if n <= 0
    number = 2
    counter = 1

    while counter != n
      number += 1
      counter += 1 if number.prime?
    end

    number
  end
end

class Integer
  def prime?
    (2..Math.sqrt(self)).all? { |k| self % k != 0 }
  end
end

module BookKeeping
  VERSION = 1
end
