=begin
Write your code for the 'Spiral Matrix' exercise in this file. Make the tests in
`spiraL_matrix_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/spiral-matrix` directory.
=end

def calculate_next_pos(pos, dir)
  x = pos[0]
  y = pos[1]

  case dir
  when :r
    [x, y + 1]
  when :d
    [x + 1, y]
  when :u
    [x - 1, y]
  when :l
    [x, y - 1]
  end
end

def next_direction(direction)
  case direction
  when :r
    :d
  when :d
    :l
  when :l
    :u
  when :u
    :r
  end
end

class SpiralMatrix
  attr_reader :matrix

  def initialize(i)
    @matrix = Array.new(i) { Array.new(i) { nil } }

    pos = [0,0]

    direction = :r

    (1..i*i).each do |n|
      x, y = pos

      puts "(#{x}, #{y}) = #{n}. Direction: #{direction}"
      @matrix[x][y] = n

      next_pos = calculate_next_pos(pos, direction)

      next_x, next_y = next_pos

      # Update direction
      if (0...i).cover?(next_x) && (0...i).cover?(next_y) && matrix[next_x][next_y].nil?
        pos = next_pos
      else
        previous_direction = direction
        direction = next_direction(direction)

        puts "Changed direction from #{previous_direction} to #{direction}."

        pos = calculate_next_pos(pos, direction)
      end
    end
  end
end
