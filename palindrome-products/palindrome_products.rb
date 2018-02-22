require 'set'

class Palindromes
  def initialize(options)
    @min = options[:min_factor] || 0
    @max = options[:max_factor]

    @palindromes = Hash.new { |s, k| s[k] = Palindrome.new(k, Set.new) }
  end

  def generate
    numbers = Array(@min..@max)

    numbers.product(numbers).each do |a, b|
      @palindromes[a * b] << [a, b] if (a * b).palindrome?
    end
  end

  def largest
    @palindromes.max[1]
  end

  def smallest
    @palindromes.min[1]
  end
end

class Integer
  def palindrome?
    to_s.reverse == to_s
  end
end

class Palindrome
  attr_reader :value

  def initialize(value, factors)
    @value = value
    @factors = factors
  end

  def <<(factor)
    @factors << factor unless @factors.include?(factor.reverse)
  end

  def factors
    @factors.to_a
  end
end
