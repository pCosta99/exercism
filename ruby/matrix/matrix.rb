=begin
Write your code for the 'Matrix' exercise in this file. Make the tests in
`matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/matrix` directory.
=end

class Matrix
  attr_reader :cols, :rows

  def initialize(str)
    @matrix = str.split("\n").map { |subs| subs.split(" ").map(&:to_i) }
    @rows = @matrix
    @cols = @matrix.transpose
  end

  def column(i)
    @cols[i - 1]
  end

  def row(i)
    @rows[i - 1]
  end
end
