class Trinary

  def initialize(trinary_str)
    @s = trinary_str
  end



  def to_decimal
    return 0 unless @s.match?(/\A[0-2]+\z/)
    @s.chars.reverse.each_with_index.sum { |c, i| c.to_i * 3**i }
  end

end



module BookKeeping

  VERSION = 1

end