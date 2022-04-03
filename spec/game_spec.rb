require 'rspec'
require './lib/player'
require './lib/board'
require './lib/game'

describe Game do
  it 'exists' do
    game = Game.new
    expect(game).to be_a Game
  end
  it 'initializes with a player1 and a player2' do
    game = Game.new
    expect(game.player1).to be_a(Player)
    expect(game.player2).to be_a(Player)
  end
  it 'initializes with a board and rules' do
    game = Game.new
    expect(game.board).to be_a(Board)
    expect(game.board.board).to eq({ 'a' => '.,.,.,.,.,.',
                                     'b' => '.,.,.,.,.,.',
                                     'c' => '.,.,.,.,.,.',
                                     'd' => '.,.,.,.,.,.',
                                     'e' => '.,.,.,.,.,.',
                                     'f' => '.,.,.,.,.,.',
                                     'g' => '.,.,.,.,.,.' })

    expect(game.rules).to be_a(Rules)
  end
  it 'starts' do
    game = Game.new
    expect(game).to respond_to(:start)
  end
  it 'starts two player game' do
    game = Game.new
    expect(game).to respond_to(:start_two_player)
  end
  it 'can produce main menu' do
    game = Game.new
    expect(game).to respond_to(:print_main_menu)
  end
end
