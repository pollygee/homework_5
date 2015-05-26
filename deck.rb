class Deck
  attr_reader :SUITS, :RANKS, :VALUES 
  def initialize
    @SUITS = [:C, :S, :H, :D]
    @RANKS = ['A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K']
    @deck = []
    @SUITS.each do |suit|
      @RANKS.each do |rank|
        c = Card.new(rank,suit)
        @deck << c

      end
    end

  end

  def cards
    @deck
  end

end