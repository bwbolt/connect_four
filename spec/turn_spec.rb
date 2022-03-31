require 'rspec'
require './lib/board'
require './lib/turn'

describe Turn do
  it 'exists' do
    # require 'pry' ; binding.pry
    board = Board.new
    turn = Turn.new(board)

    # require 'pry' ; binding.pry

    expect(turn).to be_a(Turn)
    expect(turn.board).to be_a(Board)
    expect(turn).to respond_to(:human_turn)
    expect(turn).to respond_to(:computer_turn)
  end
end
