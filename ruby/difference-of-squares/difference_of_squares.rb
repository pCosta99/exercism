# frozen_string_literal: true

# Write your code for the 'Difference Of Squares' exercise in this file. Make the tests in
# `difference_of_squares_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/difference-of-squares` directory.

class Squares
  def initialize(n)
    @n = n
  end

  def square_of_sum
    (@n * (@n + 1) / 2)**2
  end

  def sum_of_squares
    @n * (@n + 1) * (2 * @n + 1) / 6
  end

  def difference
    square_of_sum - sum_of_squares
  end
end
