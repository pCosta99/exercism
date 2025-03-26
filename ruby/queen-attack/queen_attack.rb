class Queens
  def initialize(white:, black: [0, 0])
    raise ArgumentError unless valid_position?(white) && valid_position?(black)

    @white = white
    @black = black
  end

  def attack?
    same_row? || same_column? || same_diagonal?
  end

  private

  def same_row?
    @white.first == @black.first
  end

  def same_column?
    @white.last == @black.last
  end

  def same_diagonal?
    r1, c1 = @white
    r2, c2 = @black

    (r1 - r2).abs == (c1 - c2).abs
  end

  def valid_position?(coords)
    row, col = coords

    (0..7).cover?(row) && (0..7).cover?(col)
  end
end
