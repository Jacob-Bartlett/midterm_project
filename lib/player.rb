# Represents a player in the game, holding a hand and a pot. This class should include methods to:
# •	 Ask the player which cards they wish to discard.
# •	 Determine whether the player wishes to fold, see, or raise.
require_relative 'hand'

class Player

    # Read in hand and pot
    attr_reader :hand, :pot

    # Init function to "set up" the class
    def initialize
      @hand = nil
      @pot = 10
    end
    
    # Function for a player to get cards from the current deck as a Hand object
    def get_cards(cards)
      @hand = Hand.new(cards)
    end

    # Function for the player to fold
    def fold

    end

    # Function for the player to see the current bet
    def see(amount)
        puts "The current bet's total: #{amount}"
    end

    # Function for the player to raise the bet
    def raise(amount)

    end
    
end