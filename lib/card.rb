# Represents a single playing card, identifiable by its suit and value.
class Card
    # Read in suit and value
    attr_reader :suit, :value
    
    # Init function to "set up" the class
    def initialize(suit, value)
      @suit = suit
      @value = value
    end
    
    # Function to show the cards contents in a string
    def to_s
      "#{@value} of #{@suit}"
    end
    
end