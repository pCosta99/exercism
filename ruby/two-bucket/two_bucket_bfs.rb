class TwoBucket
  attr_reader :moves, :goal_bucket, :other_bucket

  def initialize(size1, size2, goal, starting)
    @size1, @size2, @goal, @starting = size1, size2, goal, starting

    calculate
  end

  def calculate
    queue = []
    visited = {}

    initial_state = @starting == "one" ? [@size1, 0, 1] : [0, @size2, 1]
    queue << initial_state

    until queue.empty?
      b1, b2, moves = queue.shift

      if b1 == @goal
        @goal_bucket, @other_bucket, @moves = "one", b2, moves
        puts visited
        return
      elsif b2 == @goal
        @goal_bucket, @other_bucket, @moves = "two", b1, moves
        puts visited
        return
      end

      next if visited[[b1, b2]]

      visited[[b1, b2]] = true

      queue << [@size1, b2, moves + 1] unless b1 == @size1
      queue << [b1, @size2, moves + 1] unless b2 == @size2
      queue << [0, b2, moves + 1] unless b1.zero?
      queue << [b1, 0, moves + 1] unless b2.zero?

      transfer = [b1, @size2 - b2].min
      queue << [b1 - transfer, b2 + transfer, moves + 1] if transfer.positive?

      transfer = [b2, @size1 - b1].min
      queue << [b1 + transfer, b2 - transfer, moves + 1] if transfer.positive?
    end
  end
end
