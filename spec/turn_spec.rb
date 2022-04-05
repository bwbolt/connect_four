require 'rspec'
require './lib/board'
require './lib/turn'
require './lib/player'
require './lib/menu'
require './lib/rules'

describe Turn do
  it 'exists' do
    board = Board.new
    rules = Rules.new(board)
    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')
    turn = Turn.new(board, rules, player1, player2)

    expect(turn).to be_a(Turn)
  end

  it 'has a board' do
    board = Board.new
    rules = Rules.new(board)
    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')
    turn = Turn.new(board, rules, player1, player2)

    expect(turn.board).to be_a(Board)
  end

  it 'has rules' do
    board = Board.new
    rules = Rules.new(board)
    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')
    turn = Turn.new(board, rules, player1, player2)

    expect(turn.rules).to be_a(Rules)
  end

  it 'has player1' do
    board = Board.new
    rules = Rules.new(board)
    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')
    turn = Turn.new(board, rules, player1, player2)

    expect(turn.player1).to be_a(Player)
  end

  it 'has player2' do
    board = Board.new
    rules = Rules.new(board)
    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')
    turn = Turn.new(board, rules, player1, player2)

    expect(turn.player2).to be_a(Player)
  end

  it 'has a game' do
    board = Board.new
    rules = Rules.new(board)
    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')
    turn = Turn.new(board, rules, player1, player2)

    expect(turn.game).to be_a(Game)
  end

  it 'has a human turn' do
    board = Board.new
    rules = Rules.new(board)
    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')
    turn = Turn.new(board, rules, player1, player2)

    expect(turn).to respond_to(:human_turn)
  end

  it 'has a computer turn' do
    board = Board.new
    rules = Rules.new(board)
    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')
    turn = Turn.new(board, rules, player1, player2)

    board_snapshot = {
      'a' => '.,.,.,.,.,.',
      'b' => '.,.,.,.,.,.',
      'c' => '.,.,.,.,.,.',
      'd' => '.,.,.,.,.,.',
      'e' => '.,.,.,.,.,.',
      'f' => '.,.,.,.,.,.',
      'g' => '.,.,.,.,.,.'
    }

    turn.computer_turn

    expect(board.board).to_not eq(board_snapshot)
  end

  it 'has human move' do
    board = Board.new
    rules = Rules.new(board)
    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')
    turn = Turn.new(board, rules, player1, player2)

    expect(turn).to respond_to(:human_move)
  end

  it 'has a computer move' do
    board = Board.new
    rules = Rules.new(board)
    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')
    turn = Turn.new(board, rules, player1, player2)

    board_snapshot = {
      'a' => '.,.,.,.,.,.',
      'b' => '.,.,.,.,.,.',
      'c' => '.,.,.,.,.,.',
      'd' => '.,.,.,.,.,.',
      'e' => '.,.,.,.,.,.',
      'f' => '.,.,.,.,.,.',
      'g' => '.,.,.,.,.,.'
    }

    turn.computer_move

    expect(board.board).to_not eq(board_snapshot)
  end

  it 'has a human input validation' do
    board = Board.new
    rules = Rules.new(board)
    player1 = Player.new('Saba', 'X')
    player2 = Player.new('Bryce', 'O')
    turn = Turn.new(board, rules, player1, player2)

    expect(turn).to respond_to(:human_input_validator)
  end
end
