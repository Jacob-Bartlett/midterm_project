require 'rspec'
require_relative '../lib/card'  # Assuming the Card class is defined in card.rb

RSpec.describe Card do
    describe "#initialize" do
        it "Makes sure if a new card is made, it has correct values" do
            card = Card.new('H', '3')
            expect(card.suit).to eq('H')
            expect(card.value).to eq('3')
        end
    end
end