# Represents a deck of cards; responsible for shuffling and dealing cards
require_relative 'card'
require_relative 'hand'

class Deck
    # Read in cards
    attr_reader :cards

    # Init function to "set up" the class
    def initialize
      @cards = gen_deck
      shuffle_deck
    end
    
    # Deck generator that goes ahead and makes a deck of cards and assigns that deck the suit and value inside of a array using a lambda
    def gen_deck
      suits = ['H', 'D', 'C', 'S']
      values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
      deck = suits.product(values)
      deck.map { |suit, value| Card.new(suit, value) }
    end

    # Shuffle function
    def shuffle_deck
        @cards.shuffle!
    end
    
    # Deal function that takes in amt of cards to deal, removes those cards from deck, and adds them to the hand passed into the function
    def deal(amt, hand)
        cards_dealt = @cards.pop(amt)
        hand.get_cards(cards_dealt)
    end

end