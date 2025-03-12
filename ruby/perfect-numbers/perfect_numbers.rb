=begin
Write your code for the 'Perfect Numbers' exercise in this file. Make the tests in
`perfect_numbers_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/perfect-numbers` directory.
=end

module PerfectNumber
  def self.classify(n)
    raise RuntimeError unless n.positive?

    factors = factors(n)
    aliquot_sum = factors.sum

    if n == aliquot_sum
      'perfect'
    elsif n < aliquot_sum
      'abundant'
    else
      'deficient'
    end
  end

  def self.factors(n)
    (1..n / 2).filter { |f| n % f == 0 }
  end
end
