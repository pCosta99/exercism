# frozen_string_literal: true

# Write your code for the 'Pythagorean Triplet' exercise in this file. Make the tests in
# `pythagorean_triplet_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/pythagorean-triplet` directory.

class PythagoreanTriplet
  def self.triplets_with_sum(n)
    triplets = []

    1.upto(n / 3) do |a|
      b = (n * n - 2 * n * a) / (2 * n - 2 * a)

      c = n - a - b

      next unless a < b && b < c && a**2 + b**2 == c**2

      triplets << [a, b, c]
    end

    triplets
  end
end
