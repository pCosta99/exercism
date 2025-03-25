class Affine
  ALPHABET = ('a'..'z').to_a.join

  def initialize(a, b)
    raise ArgumentError unless a.gcd(ALPHABET.length) == 1

    @a = a
    @b = b
  end

  def encode(text)
    text.gsub(/\W/, '').downcase.tr(ALPHABET, cipher).chars.each_slice(5).map(&:join).join(' ')
  end

  def decode(text)
    text.delete(' ').tr(cipher, ALPHABET)
  end

  private

  def cipher
    ALPHABET.chars.map do |char|
      ALPHABET[(@a * ALPHABET.index(char) + @b) % ALPHABET.length]
    end.join
  end
end
