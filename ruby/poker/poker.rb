require 'debug'

class Poker
  class Card
    class Rank
      include Comparable

      ORDER = %w[2 3 4 5 6 7 8 9 10 J Q K A]

      attr_reader :rank

      def initialize(rank:)
        @rank = rank
      end

      def <=>(other)
        value <=> other.value
      end

      def eql?(other)
        @rank == other.rank
      end

      def hash
        rank.hash
      end

      def value
        ORDER.index(@rank)
      end

      def to_s
        @rank
      end
    end
  end
end

class Poker
  class Card
    include Comparable

    attr_reader :suit, :rank

    def initialize(suit:, rank:)
      @suit = suit
      @rank = Rank.new(rank:)
    end

    def <=>(other)
      @rank <=> other.rank
    end

    def value
      @rank.value
    end

    def to_s
      "#{rank}#{suit_to_s}"
    end

    def suit_to_s
      {
        spades: 'S',
        diamonds: 'D',
        clubs: 'C',
        hearts: 'H'
      }[@suit]
    end

    def self.parse(str)
      suit = parse_suit(str)
      rank = parse_rank(str)

      Card.new(suit:, rank:)
    end

    def self.parse_suit(str)
      {
        'S' => :spades,
        'D' => :diamonds,
        'C' => :clubs,
        'H' => :hearts
      }[str.chars.last]
    end

    def self.parse_rank(str)
      str.scan(/\d+|J|Q|K|A/).first
    end
  end
end

class Poker
  class Hand
    class Pair < Poker::Hand
      def initialize(**)
        super
      end
    end
  end
end

class Poker
  class Hand
    class TwoPairs < Poker::Hand
      def initialize(**)
        super
      end
    end
  end
end

class Poker
  class Hand
    class ThreeOfAKind < Poker::Hand
      def initialize(**)
        super
      end
    end
  end
end

class Poker
  class Hand
    class Straight < Poker::Hand
      def <=>(other)
        if lowest_sequence? && other.is_a?(StraightFlush)
          -1
        elsif other.is_a?(Straight) && other.lowest_sequence?
          1
        else
          super
        end
      end

      def lowest_sequence?
        @cards.map(&:rank).sort.map(&:rank) == %w[2 3 4 5 A]
      end
    end
  end
end

class Poker
  class Hand
    class Flush < Poker::Hand
      def initialize(**)
        super
      end
    end
  end
end

class Poker
  class Hand
    class FullHouse < Poker::Hand
      def <=>(other)
        if value == other.value
          x = @counted.sort_by { |rank, count| [count, rank] }.reverse
          y = other.counted.sort_by { |rank, count| [count, rank] }.reverse

          x.zip(y).map do |(r1, _c1), (r2, _c2)|
            r1 <=> r2
          end.find { |z| !z.zero? }
        else
          value <=> other.value
        end
      end
    end
  end
end

class Poker
  class Hand
    class FourOfAKind < Poker::Hand
      def <=>(other)
        if value == other.value
          x = @counted.sort_by { |rank, count| [count, rank] }.reverse
          y = other.counted.sort_by { |rank, count| [count, rank] }.reverse

          x.zip(y).map do |(r1, _c1), (r2, _c2)|
            r1 <=> r2
          end.find { |z| !z.zero? }
        else
          value <=> other.value
        end
      end
    end
  end
end

class Poker
  class Hand
    class StraightFlush < Poker::Hand
      def <=>(other)
        if lowest_sequence? && other.is_a?(StraightFlush)
          -1
        elsif other.is_a?(StraightFlush) && other.lowest_sequence?
          1
        else
          super
        end
      end

      def lowest_sequence?
        @cards.map(&:rank).sort.map(&:rank) == %w[2 3 4 5 A]
      end
    end
  end
end

class Poker
  class Hand
    STRUCTURES = %i[none pair two_pairs three_of_a_kind straight flush full_house four_of_a_kind straight_flush]

    include Comparable

    attr_reader :cards, :counted

    def initialize(cards:)
      @cards = cards
      @counted = cards.group_by(&:rank).transform_values(&:length)
    end

    def <=>(other)
      if value == other.value
        c1, c2 = @cards.sort_by(&:rank).reverse.zip(other.cards.sort_by(&:rank).reverse).find do |c1, c2|
          (c1 <=> c2) != 0
        end

        c1 <=> c2
      else
        value <=> other.value
      end
    end

    def value
      last_class_name = self.class.name.split('::').last
      return 0 if last_class_name == 'Hand'

      last_class_name = underscore(last_class_name)
      STRUCTURES.index(last_class_name.to_sym)
    end

    def underscore(value)
      value.gsub(/([a-z])([A-Z])/, '\1_\2') # insert underscore between lowercase and uppercase letters
           .gsub(/([A-Z])([A-Z][a-z])/, '\1_\2') # handle cases like "HTMLParser"
           .downcase
    end

    def self.parse(cards)
      cards = cards.map { |card| Card.parse(card) }
      structure = classify(cards)

      if structure != :none
        Object.const_get("Poker::Hand::#{structure.to_s.split('_').map(&:capitalize).join}").new(cards:)
      else
        Poker::Hand.new(cards:)
      end
    end

    def highest_card
      @cards.max
    end

    def to_a
      @cards.map(&:to_s)
    end

    def self.classify(cards)
      STRUCTURES.reverse.find { |s| send(:"#{s}?", cards) }
    end

    def self.none?(_)
      true
    end

    def self.pair?(cards)
      group_of?(cards, 2)
    end

    def self.two_pairs?(cards)
      group_of?(cards, 2, 2)
    end

    def self.three_of_a_kind?(cards)
      group_of?(cards, 3)
    end

    def self.straight?(cards)
      sequence?(cards)
    end

    def self.flush?(cards)
      cards.map(&:suit).uniq.length == 1
    end

    def self.full_house?(cards)
      counted = cards.group_by(&:rank).transform_values(&:length)
      counted.values.include?(3) && counted.values.include?(2)
    end

    def self.four_of_a_kind?(cards)
      group_of?(cards, 4)
    end

    def self.straight_flush?(cards)
      straight?(cards) && flush?(cards)
    end

    def self.group_of?(cards, size, count = 1)
      counted = cards.group_by(&:rank).transform_values(&:length)
      counted.values.count { |c| c == size } == count
    end

    def self.sequence?(cards)
      cards.map(&:value).sort.each_cons(2).all? do |a, b|
        return true if b == 12 && cards.min_by(&:value).value.zero?

        b == (a + 1) % Poker::Card::Rank::ORDER.length
      end
    end
  end
end

class Poker
  attr_reader :hands

  def initialize(hands)
    @hands = hands.map { |hand| Hand.parse(hand) }
  end

  def best_hand
    best_hand = @hands.max

    @hands.filter do |hand|
      hand == best_hand
    end.map(&:to_a)
  end
end

