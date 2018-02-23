class SecretHandshake
  COMMANDS = {
    0b1 => 'wink',
    0b10 => 'double blink',
    0b100 => 'close your eyes',
    0b1000 => 'jump'
  }.freeze

  REVERSE = 0b10000

  def initialize(n)
    @n = n.to_i
  end

  def commands
    c = COMMANDS.keys.reject { |flag| (@n & flag).zero? }.map(&COMMANDS.method(:[]))
    (@n & REVERSE).zero? ? c : c.reverse
  end
end
