require './card.rb'
class Hand
  def initialize
    @hand_cards =[]
  end

  def add *cards
    cards.each do |card|
      @hand_cards << card
    end
  end

  def value
    @hand_value = 0
    ace = false
    @hand_cards.each do |card|
      @hand_value += card.value
      if card.value == 1
        ace = true
      end
    end
    if ace == true && (@hand_value + 10) <= 21
      @hand_value += 10
    end
    #binding.pry
    return @hand_value
  end

  def blackjack?
    value == 21 && @hand_cards.count == 2
  end

  def first_card
    @hand_cards.first
  end

  def busted?
    value > 21
  end

  def display_hand
    display_cards = []
    @hand_cards.each do |card|
      display_cards << card.display_card 
    end
    return display_cards.join(", ")
  end
end



