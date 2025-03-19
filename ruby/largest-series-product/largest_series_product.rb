module Enumerable
  def multiply
    reduce(1, :*)
  end
end

class Series
  def initialize(series)
    raise ArgumentError unless series.match?(/\A\d+\z/)
    raise ArgumentError unless series.size.positive?

    @series = series.chars.map(&:to_i)
  end

  def largest_product(size)
    raise ArgumentError if size.negative? || size > @series.length

    @series.each_cons(size).map(&:multiply).max
  end
end
