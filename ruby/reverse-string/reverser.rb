=begin
Write your code for the 'Reverse String' exercise in this file. Make the tests in
`reverse_string_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/reverse-string` directory.
=end

module Reverser
  def self.reverse(str)
    (0...str.length).map { |i| str[-i - 1] }.join
  end
end
