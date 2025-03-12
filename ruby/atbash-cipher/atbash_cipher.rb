module Atbash
  ALPHABET = ('a'..'z').to_a
  REVERSED = ALPHABET.reverse.join

  def self.encode(str)
    str
      .downcase
      .gsub(/[^a-z\d]/, '')
      .tr(ALPHABET.join, REVERSED)
      .chars
      .each_slice(5)
      .map(&:join)
      .join(' ')
  end

  def self.decode(str)
    str.gsub(/\s/, '').tr(ALPHABET.join, REVERSED)
  end
end
