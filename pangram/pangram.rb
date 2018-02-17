class Pangram
  def self.pangram?(phrase)
    ('a'..'z').all? { |i| phrase.downcase.include? i }
  end
end

module BookKeeping
  VERSION = 6
end