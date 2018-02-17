class PhoneNumber
  def self.clean(number)
    cleaned = number.gsub(/(\D)|\D/, '').sub(/1/, '')
    cleaned.match?(/\A[2-9].{2}[2-9].{6}\z/) ? cleaned : nil
  end
end

module BookKeeping
  VERSION = 2
end
