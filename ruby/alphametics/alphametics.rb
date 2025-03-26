class Alphametics
  attr_accessor :unique_chars, :puzzle

  def self.solve(puzzle)
    new(puzzle).solve
  end

  def initialize(puzzle)
    @puzzle = puzzle
    @unique_chars = puzzle.scan(/\w/).uniq
  end

  def solve
    is_solvable = build_is_solvable

    (0..9).to_a.permutation(@unique_chars.size).each do |permutation|
      return @unique_chars.zip(permutation).to_h if is_solvable.call(*permutation)
    end

    {}
  end

  private

  def build_is_solvable
    *left, right = puzzle.scan(/\w+/).map(&:downcase)

    args = unique_chars.map(&:downcase).join(', ')

    leading_letters_not_zero = leading_letters.map { |x| x << ' != 0 ' }.join(' && ')

    eval <<-XYZ

      lambda {|#{args}|

      #{leading_letters_not_zero} && #{sum(left)} == #{sum(right)} }

    XYZ
  end

  def leading_letters
    puzzle.scan(/\b\w/).map(&:downcase)
  end

  def numerise(input)
    return input.map { |item| numerise(item) } if input[0].is_a? Array

    n = '1'

    input.each do |letter|
      letter << " * #{n}"

      n << '0'
    end
  end

  def sum(input)
    return input.map { |item| sum(item) } if input[0].is_a? Array

    numerise(letters(input)).join(' + ')
  end

  def letters(input)
    return input.map { |word| letters(word) } if input.is_a? Array

    input.reverse.scan(/\w/)
  end
end
