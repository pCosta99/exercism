require 'debug'

module FoodChain
  ANIMALS = [
    [:fly, "I don't know why she swallowed the fly. Perhaps she'll die."],
    [:spider, 'It wriggled and jiggled and tickled inside her.', ' that wriggled and jiggled and tickled inside her'],
    [:bird, 'How absurd to swallow a bird!'],
    [:cat, 'Imagine that, to swallow a cat!'],
    [:dog, 'What a hog, to swallow a dog!'],
    [:goat, 'Just opened her throat and swallowed a goat!'],
    [:cow, "I don't know how she swallowed a cow!"],
    [:horse, "She's dead, of course!"]
  ]

  def self.song
    ANIMALS.each_with_index.map do |(animal, reason, _), index|
      verse = ["I know an old lady who swallowed a #{animal}.", reason]

      unless animal == :horse
        index.downto(1) do |j|
          animal = ANIMALS[j].first
          prey, _, extra = ANIMALS[j - 1]
          verse << "She swallowed the #{animal} to catch the #{prey}#{extra}."
        end
      end

      verse << ANIMALS.first[1] unless %i[fly horse].include?(animal)

      verse.join("\n")
    end.join("\n\n") + "\n"
  end
end
