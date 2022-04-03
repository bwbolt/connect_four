require 'rspec'
require './lib/board'

describe Board do
  it 'makes an instance of the board class' do
    board = Board.new
    expect(board).to be_a Board
  end
  it 'has columns and rows' do
    board = Board.new
    expect(board.board).to eq({
                                'a' => '.,.,.,.,.,.',
                                'b' => '.,.,.,.,.,.',
                                'c' => '.,.,.,.,.,.',
                                'd' => '.,.,.,.,.,.',
                                'e' => '.,.,.,.,.,.',
                                'f' => '.,.,.,.,.,.',
                                'g' => '.,.,.,.,.,.'

                              })
  end
  it 'can print board' do
    board = Board.new
    expect(board).to respond_to(:print_board)
  end

    it 'can tell if a draw has occurred' do
    board = Board.new
    expect(board.draw).to eq(false)
  end
end
