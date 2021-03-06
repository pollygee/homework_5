require 'pry'

class Card
  attr_reader :rank, :suit
  def initialize rank, suit
    @rank = rank
    @suit = suit
    @VALUES = {:A => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9, 10 => 10, :J => 10, :Q => 10, :K => 10}
  end

  def value
    @VALUES[@rank]
  end

  def display_card 
    @rank.to_s + @suit.to_s
  end

end