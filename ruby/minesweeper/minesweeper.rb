require 'debug'

module Minesweeper
  def self.annotate(input)
    return [] if input.empty?

    input = input.map(&:chars)
    max_height, max_width = [input.length, input.first.length]
    count = Hash.new(0)

    input.each_with_index do |row, h|
      row.each_with_index do |char, w|
        next unless char == "*"

        affected_indexes(h, w, max_height, max_width).each do |x, y|
          count[[x, y]] += 1
        end
      end
    end

    input.each_with_index do |row, i|
      row.each_with_index do |char, j|
        next if char == "*"

        mines = count[[i, j]]
        input[i][j] = mines.zero? ? ' ' : mines.to_s
      end
    end

    input.map(&:join)
  end

  def self.affected_indexes(row, col, row_max, col_max)
    (row-1..row+1).map do |i|
      next if i < 0 || i >= row_max

      (col-1..col+1).map do |j|
        next if j < 0 || j >= col_max

        [i,j]
      end
    end.compact.flatten(1)
  end
end
