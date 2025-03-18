class Game
  class BowlingError < StandardError; end

  def initialize
    @rolls = []
    @score = 0
  end

  def roll(pins)
    raise BowlingError if pins.negative? || pins > 10
    raise BowlingError if game_over?

    @rolls << pins

    update_score
  end

  def score
    raise BowlingError if @rolls.size < 10 || @rolls.size > 21
    raise BowlingError if final_frame_strike_or_spare_incomplete?

    @score
  end

  private

  def update_score
    total = 0
    frame_index = 0

    10.times do
      break if frame_index >= @rolls.size

      if strike?(frame_index)
        strike_bonus = strike_bonus(frame_index)

        raise BowlingError if frame_index == 18 && @rolls.size == 21 && !strike?(19) && strike_bonus > 10

        total += 10 + strike_bonus
        frame_index += 1
      elsif spare?(frame_index)
        next if frame_index + 2 >= @rolls.size

        total += 10 + spare_bonus(frame_index)
        frame_index += 2
      else
        frame_points = sum_of_frame(frame_index)

        raise BowlingError if frame_points > 10

        total += frame_points
        frame_index += 2
      end
    end

    @score = total
  end

  def game_over?
    return false if @rolls.size < 12

    frame_index = 0
    frames_played = 0

    while frame_index < @rolls.size && frames_played < 9
      frame_index += if strike?(frame_index)
                       1
                     else
                       2
                     end
      frames_played += 1
    end

    return false if frame_index >= @rolls.size

    if strike?(frame_index)
      frame_index += 1
      @rolls.size >= frame_index + 2
    elsif spare?(frame_index)
      frame_index += 2
      @rolls.size >= frame_index + 1
    else
      @rolls.size >= frame_index + 2
    end
  end

  def final_frame_strike_or_spare_incomplete?
    return false unless @rolls.size >= 18

    last_two_rolls = @rolls[-2, 2] || []
    @rolls[-1]

    return true if strike?(18) && @rolls.size < 21
    return true if last_two_rolls.sum == 10 && @rolls.size < 21

    false
  end

  def strike?(index)
    @rolls[index] == 10
  end

  def spare?(index)
    @rolls[index, 2].sum == 10
  end

  def strike_bonus(index)
    @rolls[index + 1..index + 2].sum
  end

  def spare_bonus(index)
    @rolls[index + 2]
  end

  def sum_of_frame(index)
    @rolls[index, 2].sum
  end
end
