module RailFenceCipher
  def self.zigzag(n, ceiling)
    return 0 if ceiling == 1

    period = 2 * (ceiling - 1)
    m = n % period
    [m, period - m].min
  end

  def self.encode(message, rails)
    message.chars.each_with_object(Array.new(rails) { "" }).with_index do |(char, obj), index|
      obj[zigzag(index, rails)] << char
    end.join
  end

  def self.decode(message, rails)
    message = message.chars

    indexes = (0...message.length).each_with_object(Array.new(rails) { [] }).with_index do |(n, obj), index|
      obj[zigzag(index, rails)] << n
    end.flatten

    indexes.zip(message).sort_by(&:first).map { |_, char| char }.join
  end
end
