class Game
  class BowlingError < StandardError; end

  REGULAR_FRAME_NUMBER = 10
  STRIKE_VALUE = 10

  def initialize
    @rolls = []
    @frame_counter = 0
  end

  def roll(pins)
    if !pins.between?(0, STRIKE_VALUE)
      raise BowlingError, "You can't roll more than #{STRIKE_VALUE} pins on a single throw"
    elsif roll_at_last + pins > STRIKE_VALUE && !roll_at_last_is_strike? && !roll_at_last_is_spare?
      raise BowlingError, "You can't roll more than #{STRIKE_VALUE} pins on a single current_frame"
    elsif @frame_counter == REGULAR_FRAME_NUMBER && !roll_at_last_is_strike? && !roll_at_last_is_spare?
      raise BowlingError, "You can't roll more than #{REGULAR_FRAME_NUMBER} frames without a fillball"
    end

    @frame_counter += pins == STRIKE_VALUE ? 1.0 : 0.5
    @rolls << pins
  end

  def score(roll_index = 0, result = 0, current_frame = 0.0)

    if @rolls.empty? || @rolls.size < REGULAR_FRAME_NUMBER
      raise BowlingError, "You can't score without rolling all the frames"
    elsif (roll_at_last_is_strike? || roll_at_last_is_spare?) && last_frame?(current_frame)
      raise BowlingError, "You can't score without using your fillball"
    end

    if roll_index < @rolls.size
      if strike?(roll_index)
        if fillball?(roll_index)
          result + STRIKE_VALUE + roll_at(roll_index + 1) + roll_at(roll_index + 2)
        elsif !comes_after_a_spare?(roll_index, current_frame) && roll_index + 2 < @rolls.size
          score(roll_index + 1, result + STRIKE_VALUE + roll_at(roll_index + 1) + roll_at(roll_index + 2), current_frame + 1)
        elsif roll_index + 2 >= @rolls.size && !comes_after_a_spare?(roll_index, current_frame)
          raise BowlingError, ""
        else
          result
        end
      elsif spare?(roll_index, current_frame)
        if followed_by_spare?(roll_index, current_frame) || (roll_index == @rolls.size - 3)
          score(roll_index + 2, result + STRIKE_VALUE + roll_at(roll_index + 2), current_frame + 1)
        else
          score(roll_index + 2, result + STRIKE_VALUE + roll_at(roll_index + 2) * 2, current_frame + 1)
        end
      elsif comes_after_a_spare?(roll_index, current_frame)
        result
      else
        score(roll_index + 1, result + roll_at(roll_index), current_frame + 0.5)
      end
    else
      result
    end
  end

  def roll_at(position)
    @rolls[position] || 0
  end

  def roll_at_last
    @rolls.last || 0
  end

  def roll_at_last_is_strike?
    strike?(@rolls.size - 1)
  end

  def roll_at_last_is_spare?
    spare?(@rolls.size - 2, @frame_counter)
  end

  def fillball?(position)
    strike?(position) && (position == @rolls.size - 3)
  end

  def strike?(position)
    @rolls[position] == STRIKE_VALUE
  end

  def spare?(position, frame)
    (roll_at(position) + roll_at(position + 1)) == STRIKE_VALUE && (frame % 1).zero?
  end

  def comes_after_a_spare?(position, frame)
    spare?(position - 2, frame) && position > 1
  end

  def followed_by_spare?(position, frame)
    spare?(position + 2, frame + 1)
  end

  def last_frame?(frame)
    frame == @frame_counter
  end
end

module BookKeeping
  VERSION = 3
end
