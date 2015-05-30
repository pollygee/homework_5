require './hand.rb'

class Dealer < Player
  def show_hand
     @hand.first_card.display_card
  end

end
