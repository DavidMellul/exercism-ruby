class Complement
  DNA_TO_RNA = {
      'A' => 'U',
      'C' => 'G',
      'G' => 'C',
      'T' => 'A'
  }

  def self.of_dna(dna)
    dna.each_char.reduce('') do |rna, nucleotide|
      rna << DNA_TO_RNA.fetch(nucleotide)
    end
  rescue KeyError
    ''
  end
end

module BookKeeping
  VERSION = 4
end
