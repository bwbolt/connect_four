require 'rspec'
require './lib/board'
require './lib/rules'
require './lib/player'
require './lib/turn'

describe Rules do
  it 'exists' do
    board = Board.new
    rules = Rules.new(board)

    expect(rules).to be_a(Rules)
  end

  it 'has a board' do
    board = Board.new
    rules = Rules.new(board)

    expect(rules.board).to eq(board)
  end

  it 'has winners' do
    board = Board.new
    rules = Rules.new(board)

    expect(rules.winners).to eq(["#{board.board['a'][4]},#{board.board['b'][6]},#{board.board['c'][8]},#{board.board['d'][10]}",
                                 "#{board.board['a'][2]},#{board.board['b'][4]},#{board.board['c'][6]},#{board.board['d'][8]},#{board.board['e'][10]}",
                                 "#{board.board['a'][0]},#{board.board['b'][2]},#{board.board['c'][4]},#{board.board['d'][6]},#{board.board['e'][8]},#{board.board['f'][10]}",
                                 "#{board.board['b'][0]},#{board.board['c'][2]},#{board.board['d'][4]},#{board.board['e'][6]},#{board.board['f'][8]},#{board.board['g'][10]}",
                                 "#{board.board['c'][0]},#{board.board['d'][2]},#{board.board['e'][4]},#{board.board['f'][6]},#{board.board['g'][8]}",
                                 "#{board.board['d'][0]},#{board.board['e'][2]},#{board.board['f'][4]},#{board.board['g'][6]}", # These are the diagonals
                                 "#{board.board['a'][6]},#{board.board['b'][4]},#{board.board['c'][2]},#{board.board['d'][0]}",
                                 "#{board.board['a'][8]},#{board.board['b'][6]},#{board.board['c'][4]},#{board.board['d'][2]},#{board.board['e'][0]}",
                                 "#{board.board['a'][10]},#{board.board['b'][8]},#{board.board['c'][6]},#{board.board['d'][4]},#{board.board['e'][2]},#{board.board['f'][0]}",
                                 "#{board.board['b'][10]},#{board.board['c'][8]},#{board.board['d'][6]},#{board.board['e'][4]},#{board.board['f'][2]},#{board.board['g'][0]}",
                                 "#{board.board['c'][10]},#{board.board['d'][8]},#{board.board['e'][6]},#{board.board['f'][4]},#{board.board['g'][2]}",
                                 "#{board.board['d'][10]},#{board.board['e'][8]},#{board.board['f'][6]},#{board.board['g'][4]}",

                                 board.board['a'], board.board['b'], board.board['c'], board.board['d'], board.board['e'], board.board['f'], board.board['g'], # These are the veritcals

                                 "#{board.board['a'][0]},#{board.board['b'][0]},#{board.board['c'][0]},#{board.board['d'][0]},#{board.board['e'][0]},#{board.board['f'][0]},#{board.board['g'][0]}",
                                 "#{board.board['a'][2]},#{board.board['b'][2]},#{board.board['c'][2]},#{board.board['d'][2]},#{board.board['e'][2]},#{board.board['f'][2]},#{board.board['g'][2]}",
                                 "#{board.board['a'][4]},#{board.board['b'][4]},#{board.board['c'][4]},#{board.board['d'][4]},#{board.board['e'][4]},#{board.board['f'][4]},#{board.board['g'][4]}",
                                 "#{board.board['a'][6]},#{board.board['b'][6]},#{board.board['c'][6]},#{board.board['d'][6]},#{board.board['e'][6]},#{board.board['f'][6]},#{board.board['g'][6]}", # These are the horizontals
                                 "#{board.board['a'][8]},#{board.board['b'][8]},#{board.board['c'][8]},#{board.board['d'][8]},#{board.board['e'][8]},#{board.board['f'][8]},#{board.board['g'][8]}",
                                 "#{board.board['a'][10]},#{board.board['b'][10]},#{board.board['c'][10]},#{board.board['d'][10]},#{board.board['e'][10]},#{board.board['f'][10]},#{board.board['g'][10]}"])
  end

  it 'recycles winners' do
    board = Board.new
    rules = Rules.new(board)

    rules_now = ["#{board.board['a'][4]},#{board.board['b'][6]},#{board.board['c'][8]},#{board.board['d'][10]}",
                 "#{board.board['a'][2]},#{board.board['b'][4]},#{board.board['c'][6]},#{board.board['d'][8]},#{board.board['e'][10]}",
                 "#{board.board['a'][0]},#{board.board['b'][2]},#{board.board['c'][4]},#{board.board['d'][6]},#{board.board['e'][8]},#{board.board['f'][10]}",
                 "#{board.board['b'][0]},#{board.board['c'][2]},#{board.board['d'][4]},#{board.board['e'][6]},#{board.board['f'][8]},#{board.board['g'][10]}",
                 "#{board.board['c'][0]},#{board.board['d'][2]},#{board.board['e'][4]},#{board.board['f'][6]},#{board.board['g'][8]}",
                 "#{board.board['d'][0]},#{board.board['e'][2]},#{board.board['f'][4]},#{board.board['g'][6]}", # These are the diagonals
                 "#{board.board['a'][6]},#{board.board['b'][4]},#{board.board['c'][2]},#{board.board['d'][0]}",
                 "#{board.board['a'][8]},#{board.board['b'][6]},#{board.board['c'][4]},#{board.board['d'][2]},#{board.board['e'][0]}",
                 "#{board.board['a'][10]},#{board.board['b'][8]},#{board.board['c'][6]},#{board.board['d'][4]},#{board.board['e'][2]},#{board.board['f'][0]}",
                 "#{board.board['b'][10]},#{board.board['c'][8]},#{board.board['d'][6]},#{board.board['e'][4]},#{board.board['f'][2]},#{board.board['g'][0]}",
                 "#{board.board['c'][10]},#{board.board['d'][8]},#{board.board['e'][6]},#{board.board['f'][4]},#{board.board['g'][2]}",
                 "#{board.board['d'][10]},#{board.board['e'][8]},#{board.board['f'][6]},#{board.board['g'][4]}",

                 board.board['a'], board.board['b'], board.board['c'], board.board['d'], board.board['e'], board.board['f'], board.board['g'], # These are the veritcals

                 "#{board.board['a'][0]},#{board.board['b'][0]},#{board.board['c'][0]},#{board.board['d'][0]},#{board.board['e'][0]},#{board.board['f'][0]},#{board.board['g'][0]}",
                 "#{board.board['a'][2]},#{board.board['b'][2]},#{board.board['c'][2]},#{board.board['d'][2]},#{board.board['e'][2]},#{board.board['f'][2]},#{board.board['g'][2]}",
                 "#{board.board['a'][4]},#{board.board['b'][4]},#{board.board['c'][4]},#{board.board['d'][4]},#{board.board['e'][4]},#{board.board['f'][4]},#{board.board['g'][4]}",
                 "#{board.board['a'][6]},#{board.board['b'][6]},#{board.board['c'][6]},#{board.board['d'][6]},#{board.board['e'][6]},#{board.board['f'][6]},#{board.board['g'][6]}", # These are the horizontals
                 "#{board.board['a'][8]},#{board.board['b'][8]},#{board.board['c'][8]},#{board.board['d'][8]},#{board.board['e'][8]},#{board.board['f'][8]},#{board.board['g'][8]}",
                 "#{board.board['a'][10]},#{board.board['b'][10]},#{board.board['c'][10]},#{board.board['d'][10]},#{board.board['e'][10]},#{board.board['f'][10]},#{board.board['g'][10]}"]

    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')

    turn = Turn.new(board, rules, player1, player2)

    turn.computer_turn

    rules.recycle_winners

    expect(rules.winners).to_not eq(rules_now)
    expect(rules.winner?('O')).to eq(false)
  end
end
