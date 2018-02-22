class Brackets
  SYMBOLS = %w({ } [ ] ( )).freeze
  PAIRS = %w({} [] ()).freeze

  def self.paired?(text)
    clean = text.each_char.select(&SYMBOLS.method(:include?))

    while PAIRS.any?(&clean.join.method(:include?))
      PAIRS.each { |pair| clean = clean.join.gsub(pair.to_s, '').chars }
    end

    clean.empty?
  end
end

module BookKeeping
  VERSION = 4
end
