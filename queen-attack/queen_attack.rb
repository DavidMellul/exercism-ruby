class Queens
  BOARD_BOUNDS = [0, 7].freeze
  X, Y = 0, 1

  def initialize(queens)
    raise ArgumentError unless valid?(queens)
    @w, @b = queens[:white], queens[:black]
  end

  def valid?(queens)
    queens.values.all? {|x, y| x.between?(*BOARD_BOUNDS) && y.between?(*BOARD_BOUNDS)}
  end

  def attack?
    @w[X] == @b[X] || @w[Y] == @b[Y] || ((@w[X] - @b[X]).abs == (@w[Y] - @b[Y]).abs)
  end
end

module BookKeeping
  VERSION = 2
end