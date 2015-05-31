require './hand.rb'

class Player
  attr_reader :hand, :name, :wallet
  def initialize name
    @name = name
    @hand = []
    @wallet = 50
  end

  def new_hand
    @hand = Hand.new
  end

  def add_card_to_hand card
    @hand.add card
  end

  def change_wallet_value amount, give_or_take
    if give_or_take == :give
      @wallet += amount
    elsif give_or_take == :take
      @wallet -= amount
    end
  end
end