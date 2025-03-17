module House
  BASE = [
    ['house that Jack built.'],
    ['malt', 'lay in'],
    ['rat', 'ate'],
    ['cat', 'killed'],
    ['dog', 'worried'],
    ['cow with the crumpled horn', 'tossed'],
    ['maiden all forlorn', 'milked'],
    ['man all tattered and torn', 'kissed'],
    ['priest all shaven and shorn', 'married'],
    ['rooster that crowed in the morn', 'woke'],
    ['farmer sowing his corn', 'kept'],
    ['horse and the hound and the horn', 'belonged to']
  ].freeze

  def self.recite
    (0...BASE.size).map do |i|
      verse = "This is the #{BASE[i][0]}"

      i.downto(1) do |j|
        noun, = BASE[j - 1]
        verse += "\nthat #{BASE[j][1]} the #{noun}"
      end

      verse
    end.join("\n\n") + "\n"
  end
end
