require 'rspec'
require_relative '../lib/game'
require_relative '../lib/deck'
require_relative '../lib/player'

RSpec.describe Game do
    describe "#initialize" do
      it "Makes sure that the game set up is correct when initializing" do
        game = Game.new(4, 100)
        expect(game).to be_an_instance_of(Game)
        expect(game.instance_variable_get(:@players).size).to eq(4)
        expect(game.instance_variable_get(:@pot)).to eq(100)
        expect(game.instance_variable_get(:@init_bet)).to eq(2)
      end
    end
end