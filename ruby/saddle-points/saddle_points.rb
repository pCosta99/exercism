=begin
Write your code for the 'Saddle Points' exercise in this file. Make the tests in
`saddle_points_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/saddle-points` directory.
=end

module Grid
  def self.saddle_points(input)
    rows = input
    cols = input.transpose

    positions = []

    rows.each_with_index do |row, i|
      row_max_value = row.max

      row.each_with_index do |value, j|
        if value == row_max_value && value == cols[j].min
          positions << { 'row' => i + 1, 'column' => j + 1 }
        end
      end
    end

    positions
  end
end
