=begin
Write your code for the 'Palindrome Products' exercise in this file. Make the tests in
`palindrome_products_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/palindrome-products` directory.
=end

class Palindrome
  attr_reader :value, :factors

  def initialize(value:, factors:)
    @value = value
    @factors = factors
  end
end

class Palindromes
  attr_reader :smallest, :largest

  def initialize(max_factor:, min_factor: 1)
    raise ArgumentError, 'min must be <= max' if min_factor > max_factor

    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    lowest_value = @min_factor ** 2
    highest_value = @max_factor ** 2

    @smallest = find_palindrome(lowest_value.upto(highest_value))
    @largest = find_palindrome(highest_value.downto(lowest_value))
  end

  def find_palindrome(range)
    range.each do |candidate|
      next unless palindrome?(candidate)

      factors = factors(candidate)

      return Palindrome.new(value: candidate, factors:) unless factors.empty?
    end

    Palindrome.new(value: nil, factors: [])
  end

  def factors(number)
    (@min_factor..Math.sqrt(number)).each_with_object([]) do |factor, factors|
      other, mod = number.divmod factor
      factors << [factor, other] if mod.zero? && other.between?(@min_factor, @max_factor)
    end
  end

  private

  def palindrome?(number)
    number.to_s == number.to_s.reverse
  end
end
