=begin
Write your code for the 'Sieve' exercise in this file. Make the tests in
`sieve_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/sieve` directory.
=end

class Sieve
  attr_reader :primes

  def initialize(n)
    @array = (2..n).to_a
    @primes = []

    until @array.empty?
      prime = @array.first
      @primes << prime

      @array.reject! { |x| x % prime == 0 }
    end
  end
end
