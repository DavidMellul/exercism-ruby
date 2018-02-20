class Robot
  @@availables = ('AA000'..'ZZ999').to_a.freeze
  @@in_use = 0

  attr_reader :name

  def initialize
    reset
  end

  def self.forget
    @@in_use = 0
  end

  def reset
    @name = @@availables[@@in_use]
    @@in_use += 1
  end
end


module BookKeeping
  VERSION = 3
end