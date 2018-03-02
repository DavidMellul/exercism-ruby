class Transpose
  def self.transpose(input)
    return '' if input.match?(/\A\s\z/)

    rows = input.split(/\n/)
    transposed = []

    (0...rows.map(&:size).max).each { |i| transposed[i] = rows.map { |row| row[i] || ' ' }.join }

    transposed.join("\n").gsub(/\s+\z/, '')
  end
end

module BookKeeping
  VERSION = 1
end