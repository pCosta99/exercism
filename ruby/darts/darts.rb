class Darts
  def initialize(x, y)
    @x = x
    @y = y
  end

  def score
    case Math.hypot(@x, @y)
    when 0..1
      10
    when 1..5
      5
    when 5..10
      1
    else
      0
    end
  end
end
