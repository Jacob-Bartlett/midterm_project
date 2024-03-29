require 'rspec'
require_relative '../lib/player'
require_relative '../lib/card'

RSpec.describe Player do
    describe "#fold" do
        cards = [Card.new('H', 'A'), Card.new('S', 'K')]
        it "Player's hand should be cleared" do
            player = Player.new(100)
            player.get_cards(cards)
            player.fold
            expect(player.hand).to be_empty
        end
    end

  describe "#see" do
    it "When matching the bet reduce Player's pot by bet amount" do
      player = Player.new(100)
      amount = 50
      player.see(amount)
      expect(player.pot).to eq(50)
    end
  end

  describe "#raise" do
    it "By raising the Player's pot will be updated by subtracting the raise" do
      player = Player.new(100)
      amount = 30
      player.raise(amount)
      expect(player.pot).to eq(70)
    end
  end
end