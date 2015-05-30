require './hand.rb'

class Player
  attr_reader :hand, :name
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

  def show_value
    @hand.value
  end

  def show_hand
    @hand.display_hand
  end

  def busted?
    @hand.busted?
  end


end