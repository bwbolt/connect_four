require './lib/player'
require './lib/board'
require './lib/turn'
require './lib/menu'
require './lib/rules'

class Game
  attr_reader :player1, :player2, :board, :rules

  def initialize
    @player1 = Player.new('Player One', 'X')
    @player2 = Player.new('Computer', 'O')
    @board = Board.new
    @rules = Rules.new(@board)
  end

  def start
    p 'Please enter your name'
    print '>'
    @player1.change_name(gets.chomp.capitalize)
    @board.print_board
    until @board.draw
      turn = Turn.new(@board, @rules, @player1, @player2)
      turn.human_move(@player1)
      turn.computer_move
    end
    p "It's a DRAW!!" if @board.draw
    print_main_menu
  end

  def start_two_player
    @player1.enter_names(@player1, @player2)
    @board.print_board
    until @board.draw
      turn = Turn.new(@board, @rules, @player1, @player2)
      turn.human_move(@player1)
      turn.human_move(@player2)
    end
    p "It's a DRAW!!" if @board.draw
    print_main_menu
  end

  def print_main_menu
    menu = Menu.new
    user_input = menu.prompt
    valid_input = menu.check_input_validity(user_input)
    menu.input_coordinator(valid_input)
  end
end
