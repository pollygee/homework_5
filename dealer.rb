require './hand.rb'

class Dealer < Player
  attr_reader :done

  def initialize name
    @name = name
    @hand = []
    @done = false
  end

  def show_hand
     @hand.first_card.display_card
  end

  def hit?
    @hand.value < 17
  end
end
