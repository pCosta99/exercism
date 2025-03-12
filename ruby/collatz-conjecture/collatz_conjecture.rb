=begin
Write your code for the 'Collatz Conjecture' exercise in this file. Make the tests in
`collatz_conjecture_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/collatz-conjecture` directory.
=end

module CollatzConjecture
  def self.steps(n)
    raise ArgumentError unless n.positive?

    i = n
    steps = 0

    while i != 1
      i = i.even? ? i / 2 : i * 3 + 1

      steps += 1
    end

    steps
  end
end
