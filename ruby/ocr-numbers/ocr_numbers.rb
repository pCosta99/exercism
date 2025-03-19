require 'debug'

module OcrNumbers
  POSITION_TO_NUMBER = {
    0 => { underscore: [[0, 1], [2, 1]], bar: [[1, 0], [1, 2], [2, 0], [2, 2]] },
    1 => { underscore: [], bar: [[1, 2], [2, 2]] },
    2 => { underscore: [[0, 1], [1, 1], [2, 1]], bar: [[1, 2], [2, 0]] },
    3 => { underscore: [[0, 1], [1, 1], [2, 1]], bar: [[1, 2], [2, 2]] },
    4 => { underscore: [[1, 1]], bar: [[1, 0], [1, 2], [2, 2]] },
    5 => { underscore: [[0, 1], [1, 1], [2, 1]], bar: [[1, 0], [2, 2]] },
    6 => { underscore: [[0, 1], [1, 1], [2, 1]], bar: [[1, 0], [2, 0], [2, 2]] },
    7 => { underscore: [[0, 1]], bar: [[1, 2], [2, 2]] },
    8 => { underscore: [[0, 1], [1, 1], [2, 1]], bar: [[1, 0], [1, 2], [2, 0], [2, 2]] },
    9 => { underscore: [[0, 1], [1, 1], [2, 1]], bar: [[1, 0], [1, 2], [2, 2]] }
  }

  POSITION_TO_NUMBER_REVERSED = POSITION_TO_NUMBER.each_with_object({}) do |(number, positions), hash|
    key = {
      underscore: positions[:underscore].sort,
      bar: positions[:bar].sort
    }
    hash[key] = number # Store the number as the value
  end

  def self.convert(str)
    str = str.split("\n")

    raise ArgumentError if str.length % 4 != 0
    raise ArgumentError if str.first.length % 3 != 0

    result = str.each_slice(4).map do |row|
      columns = row.map do |slice|
        slice.chars.each_slice(3).to_a
      end

      row_digits = columns.transpose.map do |potential_number|
        number = normalize_ocr_digit(potential_number)

        POSITION_TO_NUMBER_REVERSED[number] || '?'
      end

      row_digits.join
    end

    result.join(',')
  end

  def self.normalize_ocr_digit(potential_number)
    potential_number.each_with_object({ underscore: [], bar: [] }).with_index do |(row, acc), i|
      row.each_with_index do |char, k|
        case char
        when '_'
          acc[:underscore] << [i, k]
        when '|'
          acc[:bar] << [i, k]
        end
      end
    end
  end
end
