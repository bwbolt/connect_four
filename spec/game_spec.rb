require 'rspec'
require './lib/game'

describe Game do
  it 'exists' do
    game = Game.new
    expect(game).to be_a Game
  end
end
