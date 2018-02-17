class Anagram
  def initialize(base_word)
    @bw = base_word.downcase
  end

  def match(candidates)
    candidates.select { |candidate| anagram?(candidate.downcase) }.uniq
  end

  def anagram?(word)
    @bw.chars.sort == word.chars.sort && @bw != word
  end
end

module BookKeeping
  VERSION = 2
end