require 'rspec'
require './lib/player'

describe Player do
  it 'exists' do
    player1 = Player.new('Saba', 'X')
    expect(player1).to be_a(Player)
  end
  it 'text' do
  end
end
