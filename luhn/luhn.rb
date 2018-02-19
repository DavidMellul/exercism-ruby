class Luhn
  def self.valid?(number)
    return false unless number.delete(' ').match?(/\A\d{2,}\z/)

    numbers = number.delete(' ').reverse.each_char.map(&:to_i)

    # I believe there might be a more elegant way to do it with zip.
    transformed = numbers.each_with_index.map do |n, i|
      if ((i + 1) % 2).zero?
        (n * 2) > 9 ? (n * 2) - 9 : n * 2
      else
        n
      end
    end
    computed = transformed.sum

    (computed % 10).zero?
  end
end

module BookKeeping
  VERSION = 1
end
