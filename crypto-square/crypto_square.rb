class Crypto
  def initialize(text)
    @t = text.gsub(/[[:punct:]]|\s+/, '').downcase
  end

  def ciphertext
    return '' if @t.empty?

    c = Math.sqrt(@t.size).ceil
    r = (@t.size.to_f / c).ceil

    slices = @t.chars.each_slice(c).map { |s| Array.new(c) { |i| s[i] || ' ' } }.transpose

    slices.each_with_object([]) do |s, encrypted|
      (0...c).each { |i| encrypted << s[i] }
      encrypted << ' ' if (s.join.strip.size == r || s[-1] == ' ') && s != slices.last
    end.join
  end
end

module BookKeeping
  VERSION = 1
end
