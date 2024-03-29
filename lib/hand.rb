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

    # Function if a pair exist inside of a hand
    def pair?
        values = @cards.map(&:value)
        values.each do |value|
            count = values.count(value)
            return true if count == 2
        end
        false
    end

    # Function to tell if pairs exist inside of a hand
    def pairs?
        pairs = 0
        values = @cards.map(&:value)
        values.uniq.each do |value|
            count = values.count(value)
            if count == 2
                pairs += 1
            end
        end
        if pairs == 2
            return true
        else
            false
        end
    end

    # Function to tell if there are three of a kind within a hand (three cards with same value)
    def three_kind?
        values = @cards.map(&:value)
        values.each do |value|
          count = values.count(value)
          return true if count == 3
        end
        false
    end
    
    # Function to tell if there are five cards of any suit that can be put in order
    def straight?
        values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]

        sorted = @cards.map { |card| values.index(card.value) }.sort
  
        # Check to make sure that each one is 1 more than the one before it
        (0..3).all? do |current_index|
            present = sorted[current_index]
            future = sorted[current_index + 1]
            present == future - 1
        end
    end

    # Function to check for five cards of the same suit in any order
    def flush?
        suits = @cards.map(&:suit)
        suits.uniq.size == 1
    end

    # Combination of three_kind and pair in the same hand
    def full_house?
        pair? && three_kind?
    end

    # Function to check if four cards have the same value
    def four_kind?
        values = @cards.map(&:value)
        values.each do |value|
          count = values.count(value)
          return true if count == 4
        end
        false
    end

    # Function to check if five cards have the same suit and can be put in order
    def straight_flush?
        straight? && flush?
    end

    # Function to check if hand contains a ten, jack, queen, king, ace, and all are the same suit
    def royal_flush?
        if straight_flush?
    
            royal_values = ['10', 'J', 'Q', 'K', 'A']
    
            values = @cards.map(&:value)

            if (royal_values - values).empty?
                return true
            else
                false
            end
        end
    end

    # Function that uses a case statement to assign rankings to each hand
    def rank
        case 
        when royal_flush? then 1
        when straight_flush? then 2
        when four_kind? then 3
        when full_house? then 4
        when flush? then 5
        when straight? then 6
        when three_kind? then 7
        when pairs? then 8
        when pair? then 9
        else 10
        end
    end

    # Function to compare rankings between two hand to decide a winner or a tie
    def duel(hand_one, hand_two)
        rank_one = hand_one.rank
        rank_two = hand_two.rank

        if rank_one < rank_two
            return 'hand_one'
        elsif rank_two < rank_one
            return 'hand_two'
        else
            return 'tie'
        end
    end

    # Function to read in cards from deck.rb 
    def get_cards(cards)
        @cards.concat(cards)
    end

end