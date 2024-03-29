# Contains the logic for determining the strength of a hand (pair, three-of-a-kind, two-pair, etc.), and for deciding which hand beats another.
class Hand

    # Read in cards
    attr_reader :cards

    # Init function to "set up" the class
    def initialize(cards)
        @cards = cards
    end

    # Function to show the current hand that the player has
    def show_hand
        @cards.each do |card|
            puts card
        end
    end

    # Function to read in cards from deck.rb 
    def get_cards(cards)
        @cards.concat(cards)
    end
    
end