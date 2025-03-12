=begin
Write your code for the 'Triangle' exercise in this file. Make the tests in
`triangle_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/triangle` directory.
=end

class Triangle
  def initialize(sides)
    @a, @b, @c = sides
  end

  def triangle?
    @a.positive? && @b.positive? && @c.positive? &&
      @a + @b >= @c &&
      @b + @c >= @a &&
      @a + @c >= @b
  end

  def equilateral?
    triangle? && @a == @b && @b == @c
  end

  def isosceles?
    triangle? && (@a == @b || @b == @c || @a == @c)
  end

  def scalene?
    triangle? && @a != @b && @b != @c && @a != @c
  end
end
