module IsbnVerifier
  def self.valid?(string)
    return false unless string.match?(/\d{1}-?\d{3}-?\d{5}-?(X|\d)/)

    digits = string.scan(/\d|X/).map { |x| x == 'X' ? '10' : x }.map(&:to_i)

    return false unless digits.size == 10

    sum = digits.each_with_index.sum { |digit, i| digit * (10 - i) }

    (sum % 11).zero?
  end
end
