module Blackjack
  def self.parse_card(card)
    case card
    when 'ace' then 11
    when 'two' then 2
    when 'three' then 3
    when 'four' then 4
    when 'five' then 5
    when 'six' then 6
    when 'seven' then 7
    when 'eight' then 8
    when 'nine' then 9
    when 'ten', 'queen', 'jack', 'king' then 10
    when 'joker' then 0
    end
  end

  def self.card_range(card1, card2)
    score = [card1, card2].sum { |card| parse_card(card) }

    case score
    when 4..11 then 'low'
    when 12..16 then 'mid'
    when 17..20 then 'high'
    when 21 then 'blackjack'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    range = card_range(card1, card2)

    if card1 == 'ace' && card2 == 'ace'
      'P'
    elsif range == 'blackjack' && parse_card(dealer_card) < 10
      'W'
    elsif range == 'high'
      'S'
    elsif range == 'mid' && parse_card(dealer_card) >= 7
      'H'
    elsif range == 'low'
      'H'
    else
      'S'
    end
  end
end
