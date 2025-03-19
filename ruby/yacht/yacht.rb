# rubocop:disable Style/SymbolProc
class Yacht
  POINTS = {
    yacht: ->(_) { 50 },
    ones: ->(dices) { score_roll(1, dices) },
    twos: ->(dices) { score_roll(2, dices) },
    threes: ->(dices) { score_roll(3, dices) },
    fours: ->(dices) { score_roll(4, dices) },
    fives: ->(dices) { score_roll(5, dices) },
    sixes: ->(dices) { score_roll(6, dices) },
    full_house: ->(dices) { dices.sum },
    four_of_a_kind: ->(dices) { score_four_of_a_kind(dices) },
    little_straight: ->(_) { 30 },
    big_straight: ->(_) { 30 },
    choice: ->(dices) { dices.sum }
  }.freeze

  def initialize(dices, category)
    @dices = dices
    @category = category.gsub(' ', '_').to_sym
  end

  def score
    send(:"#{@category}?") ? POINTS[@category].call(@dices) : 0
  end

  def self.score_roll(number, dices)
    number * dices.count(number)
  end

  def self.score_four_of_a_kind(dices)
    k, = dices.tally.find { |_, v| v >= 4 } || [0]

    k * 4
  end

  private

  def yacht?
    @dices.uniq.length == 1
  end

  def ones?
    roll_check?(1)
  end

  def twos?
    roll_check?(2)
  end

  def threes?
    roll_check?(3)
  end

  def fours?
    roll_check?(4)
  end

  def fives?
    roll_check?(5)
  end

  def sixes?
    roll_check?(6)
  end

  def full_house?
    @dices.tally.values.sort == [2, 3]
  end

  def four_of_a_kind?
    @dices.tally.values.any? { |v| v >= 4 }
  end

  def little_straight?
    @dices.sort == [1, 2, 3, 4, 5]
  end

  def big_straight?
    @dices.sort == [2, 3, 4, 5, 6]
  end

  def choice?
    true
  end

  def roll_check?(number)
    @dices.any? { |dice| dice == number }
  end
end
# rubocop:enable Style/SymbolProc
