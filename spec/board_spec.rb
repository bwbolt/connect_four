require 'rspec'
require './lib/board'

describe Board do
  it 'makes an instance of the board class' do
    board = Board.new
    expect(board).to be_a Board
  end
end
