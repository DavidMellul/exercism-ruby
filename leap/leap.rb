class Year
  def self.leap?(n)
    ((n % 4).zero? && !(n % 100).zero?) || (n % 400).zero?
  end
end

module BookKeeping
  VERSION = 3
end
