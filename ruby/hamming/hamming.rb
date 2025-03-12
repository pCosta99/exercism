=begin
Write your code for the 'Hamming' exercise in this file. Make the tests in
`hamming_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/hamming` directory.
=end

module Hamming
  def self.compute(s1, s2)
    raise ArgumentError unless s1.size == s2.size

    s1.chars.zip(s2.chars).count { |x,y| x != y }
  end
end
