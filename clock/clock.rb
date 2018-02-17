class Clock
  def self.at(hour, minutes)
    h = hour + minutes%24
    m = minutes/4
    "#{h}:#{m}"
  end
end