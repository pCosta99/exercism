=begin
Write your code for the 'Twelve Days' exercise in this file. Make the tests in
`twelve_days_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/twelve-days` directory.
=end

def ordinalize(n)
  case n
  when 1 then "first"
  when 2 then "second"
  when 3 then "third"
  when 4 then "fourth"
  when 5 then "fifth"
  when 6 then "sixth"
  when 7 then "seventh"
  when 8 then "eighth"
  when 9 then "ninth"
  when 10 then "tenth"
  when 11 then "eleventh"
  when 12 then "twelfth"
  when 13 then "thirteenth"
  end
end

class TwelveDays
  THINGS = [
    "and a Partridge in a Pear Tree.",
    "two Turtle Doves",
    "three French Hens",
    "four Calling Birds",
    "five Gold Rings",
    "six Geese-a-Laying",
    "seven Swans-a-Swimming",
    "eight Maids-a-Milking",
    "nine Ladies Dancing",
    "ten Lords-a-Leaping",
    "eleven Pipers Piping",
    "twelve Drummers Drumming"
  ].freeze

  def self.song
    lyrics = []

    THINGS.each_with_index do |thing, index|
      base = "On the #{ordinalize(index + 1)} day of Christmas my true love gave to me:"
      if index.zero?
        lyrics << "#{base} #{THINGS[0][4..]}\n"
      else
        lyrics << "#{base} #{THINGS[0..index].reverse.join(", ")}\n"
      end
    end

    lyrics.join("\n")
  end
end
