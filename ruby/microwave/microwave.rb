module Enumerable
  def multiply
    reduce(1) { |product, num| product * num }
  end
end

class Microwave
  def initialize(time)
    @time = time
  end

  def timer
    time = [@time, ltr_based].min

    convert(time)
  end

  private

  def ltr_based
    @time.digits.zip([1, 10, 60, 600]).sum(&:multiply)
  end

  def convert(time)
    minutes = time / 60
    seconds = time % 60

    format('%<minutes>02d:%<seconds>02d', { minutes:, seconds: })
  end
end
