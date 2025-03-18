require 'date'

class Meetup
  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, quant)
    send(:"#{quant}_day", weekday)
  end

  private

  def last_day(weekday)
    date = Date.new(@year, @month, -1)

    date.downto(Date.new(@year, @month, 1)).find do |day|
      day.send(:"#{weekday}?")
    end
  end

  def nth_day(weekday, n)
    date = Date.new(@year, @month, 1)
    date.upto(Date.new(@year, @month, -1))
        .lazy
        .select { |day| day.send(:"#{weekday}?") }
        .first(n)
        .last
  end

  def first_day(weekday)
    nth_day(weekday, 1)
  end

  def second_day(weekday)
    nth_day(weekday, 2)
  end

  def third_day(weekday)
    nth_day(weekday, 3)
  end

  def fourth_day(weekday)
    nth_day(weekday, 4)
  end

  def teenth_day(weekday)
    date = Date.new(@year, @month, 1)

    (date..).find do |day|
      day.send(:"#{weekday}?") && day.day.between?(13, 19)
    end
  end
end
