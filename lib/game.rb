# Manages the overall flow of the poker game, including:
# •	 Holding the deck of cards.
# •	 Keeping track of whose turn it is.
# •	 Managing the pot and bets placed by players
require_relative 'deck'
require_relative 'player'

class Game

    # Init function to "set up" the class    
    def initialize(num_players, start_pot)
      @deck = Deck.new
      @players = []
      (1..num_players).each do |i|
        @players.push(Player.new(start_pot))
      end
      @pot = 0
      @init_bet = 2
    end

    def start_bet_round
      @players.each do |player|
        puts "Your turn to start betting"
        player_bet(player)
      end
    end

    def discard_round
      @players.each do |player|
        puts "Your turn to discard"
        player.discard
      end
    end

    def final_bet_round
      @players.each do |player|
        puts "Your turn to finish betting"
        player_bet(player)
      end
    end

    def player_bet(player)
      loop do
        puts "Info: Your pot is #{player.pot}, game's pot is #{@pot}, your hand #{player.hand.show_hand}"
        puts "Take action by typing 'fold', 'see', or 'raise'"
        action = gets.chomp
        
        case action
          when "fold"
            player.fold
            break
          when "see"
            @pot += player.see(@init_bet)
            break
          when "raise"
            puts "Enter the amount you want to raise: "
            amount = gets.chomp.to_i
            @pot += player.raise(amount)
            @init_bet = amount
            break
          else
            puts "Can't do that"
            player_bet(player)
        end
      end
    end

    def winner
      player_one = @players[0].hand.rank
      player_two = @players[1].hand.rank

      winner = @players[0].hand.duel(player_one, player_two)

      if winner == 'hand_one'
        puts "PLAYER 1 WINS!"
      elsif winner == 'hand_two'
        puts "PLAYER 2 WINS!"
      else
        puts "TIE!"
      end
    end

    def round
      @players.each do |player|
        @deck.deal(5, player)
      end
      start_bet_round
      discard_round
      final_bet_round
      winner
    end
end

game = Game.new(2, 10)
game.round