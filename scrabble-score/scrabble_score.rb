class Scrabble
  LOOKUP_TABLE = {
    1 => %w[A E I O U L N R S T],
    2 => %w[D G],
    3 => %w[B C M P],
    4 => %w[F H V W Y],
    5 => %w[K],
    8 => %w[J X],
    10 => %w[Q Z]
  }.freeze

  @@inverse_lookup = LOOKUP_TABLE.flat_map { |count, letters| letters.product([count]) }.to_h

  def initialize(word)
    @w = word.nil? ? '' : word.gsub(/\s+/, '').upcase
  end

  def score
    @w.chars.reduce(0) { |sum, char| sum + @@inverse_lookup[char] }
  end

  def self.score(word)
    word.gsub(/\s+/, '').upcase.chars.reduce(0) { |sum, char| sum + @@inverse_lookup[char] }
  end
end
