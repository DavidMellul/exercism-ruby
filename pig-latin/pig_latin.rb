class PigLatin
  def self.translate(words)
    words.split(/\s/).map do |word|
      case word
      when /\A[aeiou]|\Axr|\Ayt/
        word + 'ay'
      when /\A([schquy]+|[^aeiouy]+)(.+)/
        Regexp.last_match(2) + Regexp.last_match(1) + 'ay'
      end
    end.join(' ')
  end
end

module BookKeeping
  VERSION = 2
end
