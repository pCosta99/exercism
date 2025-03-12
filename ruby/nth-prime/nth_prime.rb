# frozen_string_literal: true

# Write your code for the 'Nth Prime' exercise in this file. Make the tests in
# `nth_prime_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/nth-prime` directory.

module Prime
  def self.nth(n)
    raise ArgumentError unless n.positive?

    primes = 0
    i = 0

    while primes < n
      i += 1
      primes += 1 if self.prime?(i)
    end

    i
  end

  def self.prime?(n)
    return false if n == 1
    return true if n == 2

    (2..Math.sqrt(n).ceil).each do |i|
      return false if (n % i).zero?
    end

    true
  end
end
