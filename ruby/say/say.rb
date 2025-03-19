class Say
  HASH = {
    0 => :zero,
    1 => :one,
    2 => :two,
    3 => :three,
    4 => :four,
    5 => :five,
    6 => :six,
    7 => :seven,
    8 => :eight,
    9 => :nine,
    10 => :ten,
    11 => :eleven,
    12 => :twelve,
    13 => :thirteen,
    14 => :fourteen,
    15 => :fifteen,
    16 => :sixteen,
    17 => :seventeen,
    18 => :eighteen,
    19 => :nineteen,
    20 => :twenty,
    30 => :thirty,
    40 => :forty,
    50 => :fifty,
    60 => :sixty,
    70 => :seventy,
    80 => :eighty,
    90 => :ninety
  }

  LARGE_UNITS = {
    1_000_000_000 => :billion,
    1_000_000 => :million,
    1_000 => :thousand,
    100 => :hundred
  }

  LIMIT = 1_000_000_000_000

  def initialize(number)
    @number = number
  end

  def in_english
    raise ArgumentError if @number.negative? || @number >= LIMIT

    return HASH[@number].to_s if HASH.key?(@number)

    num = @number
    words = []

    LARGE_UNITS.each do |value, name|
      if num >= value
        words << "#{convert_hundreds(num / value)} #{name}"
        num %= value
      end
    end

    words << convert_hundreds(num) if num.positive?
    words.join(' ')
  end

  private

  def convert_hundreds(num)
    return HASH[num] if HASH.key?(num)

    words = []
    if num >= 100
      words << "#{HASH[num / 100]} hundred"
      num %= 100
    end

    if num >= 20
      tens = HASH[(num / 10) * 10]
      ones = num % 10

      words << (ones.zero? ? tens : "#{tens}-#{HASH[ones]}")
    elsif num.positive?
      words << HASH[num]
    end

    words.join(' ')
  end
end
