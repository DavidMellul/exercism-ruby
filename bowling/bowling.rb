class Game
  class BowlingError < StandardError;
  end

  def initialize
    @rolls = []
    @frames = 0
  end

  def roll(pins)
    if !pins.between?(0, 10)
      raise BowlingError
    elsif roll_at_last + pins > 10 && !roll_at_last_is_strike? && !roll_at_last_is_spare?
      raise BowlingError
    elsif @frames == 10.0 && !roll_at_last_is_strike? && !roll_at_last_is_spare?
      raise BowlingError
    end

    @frames += pins == 10 ? 1.0 : 0.5

    @rolls << pins
  end

  def score(position = 0, result = 0, frame = 0.0)
    raise BowlingError if @rolls.empty? || @rolls.size < 10 || ((roll_at_last_is_strike? || roll_at_last_is_spare?) && is_last_frame(frame))

    if position < @rolls.size
      if is_strike?(position)
        if is_fillball?(position)
          result + 10 + roll_at(position + 1) + roll_at(position + 2)
        elsif !comes_after_a_spare?(position, frame) && position+2 < @rolls.size
          score(position + 1, result + 10 + roll_at(position + 1) + roll_at(position + 2), frame + 1)
        elsif position+2 >= @rolls.size && !comes_after_a_spare?(position,frame)
          raise BowlingError
        else
          result
        end
      elsif is_spare?(position, frame)
        if followed_by_spare?(position,frame) || (position == @rolls.size-3)
          score(position + 2, result + 10 + roll_at(position+2), frame + 1)
        else
          score(position + 2, result + 10 + roll_at(position+2)*2, frame + 1)

        end
      elsif comes_after_a_spare?(position,frame)
        result
      else
        score(position + 1, result + roll_at(position), frame + 0.5)
      end
    else
      result
    end
  end

  def roll_at(position)
    position >= 0 ? (@rolls[position] || 0) : 0
  end

  def roll_at_last
    @rolls.last || 0
  end

  def roll_at_last_is_strike?
    is_strike?(@rolls.size-1)
  end

  def roll_at_last_is_spare?
    is_spare?(@rolls.size-2,@frames)
  end

  def is_fillball?(position)
    is_strike?(position) && (position == @rolls.size - 3)
  end

  def is_strike?(position)
    @rolls[position] == 10
  end

  def is_last_roll?(position)
    position == @rolls.size - 1
  end

  def is_spare?(position, frame)
    (roll_at(position) + roll_at(position + 1)) == 10 && frame % 1 == 0
  end

  def comes_after_a_spare?(position,frame)
    is_spare?(position-2,frame) && position > 1
  end

  def followed_by_spare?(position,frame)
    is_spare?(position+2,frame+1)
  end

  def is_last_frame(frame)
    frame == @frames
  end
end

module BookKeeping
  VERSION = 3
end