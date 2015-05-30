class Deck
  attr_reader :SUITS, :RANKS, :VALUES, :drawn, :deck
  def initialize
    @SUITS = [:C, :S, :H, :D]
    @RANKS = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K]
    @deck = []
    @drawn = []
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

  def draw
    pick = @deck.sample
    @deck.delete(pick)
    @drawn << pick
    return pick
  end



end