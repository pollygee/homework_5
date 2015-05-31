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

      print "You have $#{@player.wallet}, how much would you like to bet (give a whole dollar amount that does not exceed your walled)? "
      bet_amount = gets.chomp.to_i
      while bet_amount > @player.wallet
        put "Nice try budy, you only have #{@player.wallet} to spend, please bet a valid amount"
        bet_amount = gets.chomp.to_i
      end



      if @player.hand.blackjack? 
        @winner = @player
        system "clear"
        puts "\n#{@player.name} had blackjack - that's an automatic win!"
      elsif @dealer.hand.blackjack?
        @winner = @dealer
        system "clear"
        puts "\n#{@dealer.name} had blackjack - that's an automatic win"
      end

      if @winner == 'none'
        loop do
          system("clear")
          puts "Player cards are : #{@player.hand.display_hand}\n"
          puts "Dealer showing card is: #{@dealer.show_hand} \n\n"
          print "Do you want to hit? (y or n)  > "
          hit = gets.chomp.downcase
          break if hit == 'n'
          deal_card @player
          if @player.hand.busted?
            puts "#{@player.name} has busted"
            @winner = @dealer
            break
          end
        end

        done = false
        while !done
          if @dealer.hit? 
            deal_card @dealer
          else
            done = true
          end
        end

        if @dealer.hand.busted?
          puts "#{@dealer.name} has busted"
          @winner = @player
        end

        if @winner == 'none'
          if @player.hand.value > @dealer.hand.value
            @winner = @player
          elsif @player.hand.value < @dealer.hand.value
            @winner = @dealer
          end
        end
      end

      if @winner == @player
        @player.change_wallet_value  bet_amount, :give
      elsif @winner == @dealer
        @player.change_wallet_value bet_amount, :take
      end

      puts "\nPlayer #{@player.name} had #{@player.hand.value}"
      puts "Dealer #{@dealer.name} had #{@dealer.hand.value}"

      if @winner == 'none'
        puts "This hand is a draw - no winners this time around!"
      else
        puts "Winner is #{@winner.name}"
      end

      puts "\n\nPlayer wallet now $#{@player.wallet}"
      if @player.wallet == 0
        puts 'You have no more moeny to spend your game is over, Goodbye!'
        break
      end
      print "Do you want to play another hand? (y or n) > "
      @wants_to_play = gets.chomp.downcase
      system "clear"
    end
    puts "Blackjack Game over!  Thanks for playing!"
  end
end



game = Blackjack.new 
game.start_game
game.play_hand



