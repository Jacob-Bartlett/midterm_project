# Manages the overall flow of the poker game, including:
# •	 Holding the deck of cards.
# •	 Keeping track of whose turn it is.
# •	 Managing the pot and bets placed by players
require_relative 'deck'
require_relative 'player'

class Game

    # Init function to "set up" the class    
    def initialize
      @deck = Deck.new
      @players = []
      @pot = 0
    end
    
end