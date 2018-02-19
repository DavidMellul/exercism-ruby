class IsbnVerifier
  def self.valid?(isbn)
    clean = isbn.delete('-')

    return false if clean.count('X') > 1 || (clean.count('X') == 1 && clean.index('X') != clean.size-1) || clean.size != 10

    computed = clean.each_char.with_index.sum { |char, index| ((char == 'X' ? 10 : char.to_i) * (10 - index)) }

    (computed % 11).zero?
  end
end

module BookKeeping
  VERSION = 1
end
