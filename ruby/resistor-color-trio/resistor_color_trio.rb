=begin
Write your code for the 'Resistor Color Trio' exercise in this file. Make the tests in
`resistor_color_trio_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/resistor-color-trio` directory.
=end

class ResistorColorTrio
  TABLE = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  def initialize(colors)
    @ohms = colors[0..1].map { |color| TABLE[color.to_sym] }.join.to_i * (10**TABLE[colors[2].to_sym])
  end

  def label
    unit, value = best_unit(@ohms)

    "Resistor value: #{value.to_i} #{unit}ohms"
  end

  private

  def best_unit(ohms)
    case @ohms
    when 1_000_000..Float::INFINITY
      ['M', @ohms / 1_000_000.0]
    when 1000..999_999
      ['kilo', @ohms / 1000.0]
    else
      ['', @ohms]
    end
  end
end
