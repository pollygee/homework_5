require './card.rb'
require './deck.rb'
require './player.rb'
require './hand.rb'
require './dealer.rb'
require 'pry'


class Blackjack
  def initialize

  end

  def deal_card which_player
    which_player.add_card_to_hand(@game_deck.draw)
  end

  def start_game
    print "Ready to play some blackjack? (y or n) > "
    @wants_to_play = gets.chomp.downcase
    print "What is player's name? > "
    @p1_name = gets.chomp
    print "What is the dealer's name? > "
    @p2_name = gets.chomp

    @player = Player.new(@p1_name)
    @dealer = Dealer.new(@p2_name)
    @game_deck = Deck.new #returns a shuffled deck ready for the game
  end

  def play_game
    while @wants_to_play == 'y'
      #deal the cards
      @player_hand = @player.new_hand
      @dealer_hand = @dealer.new_hand
      deal_card @player
      deal_card @player
      deal_card @dealer
      deal_card @dealer

      #display the cards
      puts "Player cards are : #{@player.show_hand}"
      puts "Dealer showing card is: #{@dealer.show_hand}"


      print "Do you want to play another hand? (y or n) > "
      @wants_to_play = gets.chomp.downcase
    end
    puts "Blackjack Game over!  Thanks for playing!"
  end

  def switch_player
    
  end

  def hand_over?
    
  end

end



game = Blackjack.new 
game.start_game
game.play_game



