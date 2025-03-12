class Bucket
  attr_reader :max
  attr_accessor :current

  def initialize(max, fill)
    @max = max
    @current = fill ? max : 0
  end

  def full?
    max == current
  end

  def not_empty?
    current.positive?
  end

  def empty?
    current.zero?
  end

  def not_full?
    max != current
  end

  def fill
    @current = @max
  end

  def empty
    @current = 0
  end

  def transfer(bucket)
    max_transfer = bucket.max - bucket.current
    transfer = [@current, max_transfer].min
    @current -= transfer
    bucket.current += transfer
  end
end

class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(size1, size2, goal, starting)
    @goal = goal
    @b1 = Bucket.new(size1, starting == "one")
    @b2 = Bucket.new(size2, starting == "two")
    @last_move = starting == "one" ? :f1 : :f2
    @moves = 1

    calculate
  end

  def calculate
    until @b1.current == @goal || @b2.current == @goal
      if @b1.max == @goal
        @b1.fill
        @last_move = :f1
      elsif @b2.max == @goal
        @b2.fill
        @last_move = :f2
      elsif @b1.not_empty? && @b2.not_full? && @last_move != :t21
        @b1.transfer(@b2)
        @last_move = :t12
      elsif @b2.not_empty? && @b1.not_full? && @last_move != :t12
        @b2.transfer(@b1)
        @last_move = :t21
      elsif @b1.full? && @b2.not_full?
        @b1.empty
        @last_move = :e1
      elsif @b2.full? && @b1.not_full?
        @b2.empty
        @last_move = :e2
      elsif @b1.empty? && @b2.not_empty?
        @b1.fill
        @last_move = :f1
      elsif @b2.empty? && @b1.not_empty?
        @b2.fill
        @last_move = :f2
      end

      @moves += 1
    end

    @goal_bucket, @other_bucket =
      if @b1.current == @goal
        ["one", @b2.current]
      else
        ["two", @b1.current]
      end
  end
end
