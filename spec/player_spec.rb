require 'rspec'
require './lib/player'

describe Player do
  it 'exists' do
    player1 = Player.new('Saba', 'X')
    expect(player1).to be_a(Player)
  end

  it 'has a name' do
    player1 = Player.new('Saba', 'X')
    expect(player1.name).to eq('Saba')
  end

  it 'has a token' do
    player1 = Player.new('Saba', 'X')
    expect(player1.token).to eq('X')
  end

  it 'can change player names' do
    player1 = Player.new('Saba', 'X')
    expect(player1).to respond_to(:enter_names)
  end
end
