=begin
Write your code for the 'Transpose' exercise in this file. Make the tests in
`transpose_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/transpose` directory.
=end

class Transpose
  def self.transpose(text)
    rows = text.split("\n")
    max_length = rows.map(&:length).max || 0

    # Pad all rows to the same length so transposition works correctly
    padded_rows = rows.map { |row| row.ljust(max_length, ' ') }

    # Transpose the matrix (convert to chars, transpose, then join back)
    transposed = padded_rows.map(&:chars).transpose.map(&:join)

    # Only strip trailing spaces from the final result, not individual lines
    transposed.join("\n").sub(/\s+\z/, '')
  end
end
