class Prime
  def self.nth(n)
    raise ArgumentError if n <= 0
    number = 2
    counter = 1

    while counter < n
      number += 1
      counter += 1 if prime?(number)
    end

    number
  end

  def self.prime?(n)
    (2..Math.sqrt(n)).all? { |k| n % k != 0 }
  end
end

module BookKeeping
  VERSION = 1
end
