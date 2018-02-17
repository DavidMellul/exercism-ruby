class Phrase
  def initialize(s)
    @sentence = s
  end

  # This must be the worst solution to this exercise, I should improve it with some 'Remove quotation, remove punctuation, keep alphanumerical and single quotes only'
  def word_count
    clean = @sentence.downcase.gsub(/(,|:|\.|'\s)/, ' ')
    clean = clean.split(/(,|\s+)/).map do |word|
      word.chomp('\'').reverse.chomp('\'').reverse.gsub(/(!|&|@|\$|%|\^)/, '')
    end

    clean = clean.reject {|word| word.include? ' '}
    clean.reduce({}) do |dict, word|
      dict.update(word => clean.count {|x| x == word})
    end
  end
end

module BookKeeping
  VERSION = 1
end
