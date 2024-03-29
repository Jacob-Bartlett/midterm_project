require 'rspec'
require_relative '../lib/hand'
require_relative '../lib/card'

RSpec.describe Hand do
    describe "#pair?" do
        it "Returns true if a pair is found" do
            cards = [Card.new('H', '5'), Card.new('D', '5'), Card.new('H', '3'), Card.new('C', '2'), Card.new('S', '9')]
            hand = Hand.new(cards)
            expect(hand.pair?).to be true
        end

        it "Returns false if a pair is not found" do
            cards = [Card.new('H', '5'), Card.new('D', '4'), Card.new('H', '3'), Card.new('C', '2'), Card.new('S', '9')]
            hand = Hand.new(cards)
            expect(hand.pair?).to be false
        end
    end

    describe "#straight_flush?" do
        it "Returns true if a straight flush is found" do
            cards = [Card.new('C', '10'), Card.new('C', 'J'), Card.new('C', 'Q'), Card.new('C', 'K'), Card.new('C', 'A')]
            hand = Hand.new(cards)
            expect(hand.straight_flush?).to be true
        end
    end

    describe "#royal_flush?" do
        it "Returns true if a royal flush is found" do
            cards = [Card.new('S', '10'), Card.new('S', 'J'), Card.new('S', 'Q'), Card.new('S', 'K'), Card.new('S', 'A')]
            hand = Hand.new(cards)
            expect(hand.royal_flush?).to be true
        end

        it "Returns false if a royal flush is not found" do
            cards = [Card.new('H', '9'), Card.new('H', '10'), Card.new('H', 'J'), Card.new('H', 'Q'), Card.new('H', 'K')]
            hand = Hand.new(cards)
            expect(hand.royal_flush?).to be false
        end
    end

    describe "#duel" do
        let(:royal_flush_hand) { Hand.new([Card.new('S', '10'), Card.new('S', 'J'), Card.new('S', 'Q'), Card.new('S', 'K'), Card.new('S', 'A')]) }
        let(:straight_flush_hand) { Hand.new([Card.new('C', '10'), Card.new('C', 'J'), Card.new('C', 'Q'), Card.new('C', 'K'), Card.new('C', '9')]) }

        it "Return hand_one if the first hand is stronger" do
            result = Hand.new([]).duel(royal_flush_hand, straight_flush_hand)
            expect(result).to eq('hand_one')
        end
    end

end