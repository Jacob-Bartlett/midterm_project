# Represents a player in the game, holding a hand and a pot. This class should include methods to:
# •	 Ask the player which cards they wish to discard.
# •	 Determine whether the player wishes to fold, see, or raise.
require_relative 'hand'

class Player

    # Read in hand and pot
    attr_reader :hand, :pot

    # Init function to "set up" the class
    def initialize(pot)
      @hand = []
      @pot = pot
    end
    
    # Function for a player to get cards from the current deck as a Hand object
    def get_cards(cards)
      @hand += cards
    end

    # Function for the player to fold
    def fold
        @hand.clear
        puts "Player has folded"
    end

    # Function for the player to see the current bet
    def see(amount)
        if @pot >= amount
            puts "The current Player matches: #{amount}"
            @pot -= amount
             return amount
        else
            puts "Can't match"
            return 0
        end
    end

    # Function for the player to raise the bet
    def raise(amount)
        if amount <= @pot
            puts "Bet has been raised a total of #{amount}"
            @pot -= amount
            return amount
        else
            puts "Can't raise"
            return 0
        end
    end

end