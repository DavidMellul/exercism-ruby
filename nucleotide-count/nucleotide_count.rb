class Nucleotide
  def initialize(dna)
    @dna = dna
  end

  def self.from_dna(dna)
    raise ArgumentError unless dna.match?(/\A[ATGC]*\z/)
    Nucleotide.new(dna)
  end

  def count(nucleotide)
    @dna.count(nucleotide)
    # Without abusing language capabilities :
    # @dna.each_char.select { |n| n == nucleotide }.size
  end

  def histogram
    %w[A T G C].map { |n| [n, count(n)] }.to_h
  end
end
