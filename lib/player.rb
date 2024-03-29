# Represents a player in the game, holding a hand and a pot. This class should include methods to:
# •	 Ask the player which cards they wish to discard.
# •	 Determine whether the player wishes to fold, see, or raise.
require_relative 'hand'

class Player

    # Read in hand and pot
    attr_reader :hand, :pot

    # Init function to "set up" the class
    def initialize(pot)
      @hand = Hand.new([])
      @pot = pot
    end
    
    # Function for a player to get cards from the current deck as a Hand object
    def get_cards(cards)
      @hand.get_cards(cards)
    end

    # Function for the player to fold
    def fold
        @hand = Hand.new([])
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

    def discard
        puts "Current hand:"
        
        @hand.show_hand

        puts "Enter what cards you want removed:"
        user_input = gets.chomp.split(' ')

        indexes = []
        user_input.each do |index|
            correct_index = index.to_i - 1
            indexes.push(correct_index)
        end

        

        indexes.sort.reverse_each do |index|
            if index.between?(0, @hand.cards.size - 1)
            @hand.delete_at(index)  
        end
    end
end