require './hand.rb'

class Player
  attr_reader :hand
  def initialize name
    @name = name
    @hand = []
  end

  def new_hand
    @hand = Hand.new
  end

  def add_card_to_hand card
    @hand.add card
  end

  def show_hand
    @hand.display_hand
  end

end