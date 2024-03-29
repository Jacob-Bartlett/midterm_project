require 'rspec'
require_relative '../lib/deck'
require_relative '../lib/hand'

# Test for checking if the cards dealt into the hand from the deck match
describe Deck do
    describe '#deal' do
        it 'checks if the cards dealt into the hand from the deck match' do
        deck = Deck.new
        hand = Hand.new([])

        dealt_cards = deck.deal(5, hand)

        expect(dealt_cards).to eq(hand.cards)

        end
    end
end