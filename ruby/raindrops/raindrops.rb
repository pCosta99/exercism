=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end

module Raindrops
  SOUNDS = { 3 => "Pling", 5 => "Plang", 7 => "Plong" }.freeze

  def self.convert(n)
    sounds = SOUNDS.filter { |k, v| (n % k).zero? }.values

    sounds.any? ? sounds.join : n.to_s
  end
end
