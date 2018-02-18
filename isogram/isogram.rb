class Isogram
  def self.isogram?(str)
    clean = str.downcase.delete(' -')
    clean.each_char.all? { |char| clean.count(char) == 1 }
  end
end

module BookKeeping
  VERSION = 4
end