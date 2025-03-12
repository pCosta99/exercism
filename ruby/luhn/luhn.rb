=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end

module Luhn
  def self.valid?(str)
    digits = str.delete(' ').chars.reverse
    return false if digits.length < 2 || digits.any? { |c| c !~ /\d/ }

    digits.each_with_index.sum do |c, i|
      n = c.to_i

      i.odd? ? (n * 2 > 9 ? n * 2 - 9 : n * 2) : n
    end % 10 == 0
  end
end
