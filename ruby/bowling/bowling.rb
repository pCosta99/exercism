class Game
  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    total = 0
    frame_index = 0

    10.times do
      if strike?(frame_index)
        total += 10 + strike_bonus(frame_index)
        frame_index += 1
      elsif spare?(frame_index)
        total += 10 + spare_bonus(frame_index)
        frame_index += 2
      else
        total += sum_of_frame(frame_index)
        frame_index += 2
      end
    end

    total
  end

  private

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
