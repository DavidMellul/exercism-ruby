class Phrase
  def initialize(sentence)
    @s = sentence.downcase
  end

  def word_count
    words = @s.scan(/\b[\w']+\b/)
    words.reduce({}) { |counts, w| counts.update(w => words.count(w)) }
  end
end

module BookKeeping
  VERSION = 1
end
