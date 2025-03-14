module PigLatin
  def self.translate(sentence)
    sentence.split(' ').map { |word| translate_word(word) }.join(' ')
  end

  def self.translate_word(word)
    case word
    when /^(a|e|i|o|u|xr|yt)/
      word + 'ay'
    when /^([b-df-hj-np-tv-z]+)(y.*)/
      x, = word.scan(/^([b-df-hj-np-tv-z]+)(y.*)/)
      x.reverse.join + 'ay'
    when /^([b-df-hj-np-tv-z]*qu)(.*)/
      x, = word.scan(/^([b-df-hj-np-tv-z]*qu)(.*)/)
      x.reverse.join + 'ay'
    when /^([b-df-hj-np-tv-z]+)(.*)/
      x, = word.scan(/^([b-df-hj-np-tv-z]+)(.*)/)
      x.reverse.join + 'ay'
    end
  end
end
