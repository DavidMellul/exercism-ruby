class Binary
  def self.to_decimal(binary_str)
    raise ArgumentError unless binary_str.match?(/^[01]+$/)
    binary_str.reverse.each_char.with_index.reduce(0) do |decimal, (bit, position)|
      decimal + (2**position)*bit.to_i
    end
  end
end

module BookKeeping
  VERSION = 3
end
