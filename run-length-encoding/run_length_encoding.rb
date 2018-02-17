class RunLengthEncoding
  def self.encode(text)
    text.chars.chunk { |c| c }.flat_map do |char, array|
      (array.size > 1 ? array.size.to_s : '') + char
    end.join
  end

  def self.decode(text)
    text.scan(/(\d+)?(.)/).reduce('') do |decoded, (count, c)|
      decoded << c * (count ? count.to_i : 1)
    end
  end

end

module BookKeeping
  VERSION = 3
end
