class Hexadecimal
  SYMBOLS = ('a'..'f').zip(10..15).to_h

  def initialize(hex_str)
    @n = hex_str
  end

  def to_decimal
    return 0 unless @n.match?(/\A[a-f\d]+\z/)

    @n
      .reverse
      .each_char
      .with_index
      .sum do |char, index|
      (SYMBOLS[char] || char.to_i) * (16**index)
    end

  end
end
