require './card.rb'
require './deck.rb'
require './player.rb'
require './hand.rb'
require './dealer.rb'
require 'pry'


class Blackjack
  def initialize
    @hand_over = false
  end

  def deal_card which_player
    which_player.add_card_to_hand(@game_deck.draw)
  end

  def start_game
    system "clear"
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

  def play_hand
    while @wants_to_play == 'y'
      @winner = 'none'
      #deal the cards
      @player_hand = @player.new_hand
      @dealer_hand = @dealer.new_hand
      deal_card @player
      deal_card @player
      deal_card @dealer
      deal_card @dealer

      if @player.show_value == 21
        @winner = @player
      elsif @dealer.show_value == 21
        @winner = @dealer
      end

      loop do
        system("clear")
        puts "Player cards are : #{@player.show_hand}\n"
        puts "Dealer showing card is: #{@dealer.show_hand} \n\n"
        print "Do you want to hit? (y or n)  > "
        hit = gets.chomp.downcase
        break if hit == 'n'
        deal_card @player
        if @player.busted?
          puts "#{@player.name} has busted"
          @winner = @dealer
          break
        end
      end

      loop do
        if @dealer.play_turn == 'hit'
          deal_card @dealer
        end
        if @dealer.busted?
          "#{@dealer.name} has busted"
          @winner = @player
        end
        break if @dealer.done
        
      end

      if @player.show_value > @dealer.show_value
        @winner = @player
      else
        @winner = @dealer
      end

      puts "Winner is #{@winner.name}"
      print "Do you want to play another hand? (y or n) > "
      @wants_to_play = gets.chomp.downcase

    end
    puts "Blackjack Game over!  Thanks for playing!"
  end


end



game = Blackjack.new 
game.start_game
game.play_hand



