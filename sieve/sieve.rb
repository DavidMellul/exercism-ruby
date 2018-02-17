class Sieve
  def initialize(n)
    @n = n
  end

  def primes
    marked = []
    sieve = []
    (2..@n).map do |i|
      unless marked.include? i
        sieve << i unless marked.include? i
        marked.concat((i..@n).map { |x| i * x })
      end
    end
    sieve
  end
end

module BookKeeping
  VERSION = 1
end
