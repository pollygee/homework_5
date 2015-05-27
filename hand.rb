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
    value == 21
  end

  def busted?
    value > 21
  end

  def to_s
    binding.pry
    cards.each do |card|
      
    end
  end
end



