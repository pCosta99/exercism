=begin
Write your code for the 'Pangram' exercise in this file. Make the tests in
`pangram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/pangram` directory.
=end

module Pangram
  def self.pangram?(str)
    str.downcase.scan(/[a-z]/).to_set.size == 26
  end
end
