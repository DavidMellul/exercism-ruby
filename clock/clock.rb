class Clock
  def self.at(hour, minutes)
    h = (hour % 24) + ((minutes%60).zero? ? 0:minutes/60)
    m = minutes % 60

    ClockObject.new(h,m)
  end
end

class ClockObject
  def initialize(hours, minutes)
    @h = hours
    @m = minutes
  end

  def to_s
    hours = @h > 10 ? @h.to_s : "0#{@h}"
    minutes = @m > 10 ? @m.to_s : "0#{@m}"
    "#{hours}:#{minutes}"
  end

  def -()
end
