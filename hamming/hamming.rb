class Hamming
  def self.compute(a, b)
    raise ArgumentError unless a && b && a.size == b.size
    a.each_char.with_index.count do |nucleotide, index|
      nucleotide != b[index]
    end
  end
end

module BookKeeping
  VERSION = 3
end
