class PrimeFactors
  def self.for(n)
    k = 2
    tmp = n
    factors = []

    while tmp > 1
      while (tmp % k).zero?
        factors << k
        tmp /= k
      end
      k += 1
    end
    
    factors
  end
end
