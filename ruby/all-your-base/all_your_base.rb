=begin
Write your code for the 'All Your Base' exercise in this file. Make the tests in
`all_your_base_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/all-your-base` directory.
=end

module BaseConverter
  def self.convert(input_base, digits, output_base)
    raise ArgumentError, "Base must be >= 2" if input_base < 2 || output_base < 2
    raise ArgumentError, "Digits must not contain negative numbers" if digits.any?(&:negative?)

    if digits.any? { |digit| digit < 0 || digit >= input_base }
      raise ArgumentError, "Invalid digit for input base"
    end

    base_10 = digits.reverse.each_with_index.sum { |digit, index| digit * (input_base ** index) }

    convert(base_10, output_base)
  end

  def self.convert(number, base)
    return [0] if number == 0

    digits = []

    while number > 0
      digits.unshift(number % base)
      number /= base
    end

    digits
  end
end
