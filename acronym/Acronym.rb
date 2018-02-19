class Acronym
  def self.abbreviate(str)
    str.scan(/\b\w/).map(&:upcase).join
  end
end

module BookKeeping
  VERSION = 4
end