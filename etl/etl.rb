class ETL
  def self.transform(old)
    old.flat_map { |count, letter| letter.map(&:downcase).product([count]) }.to_h
  end
end

module BookKeeping
  VERSION = 1
end