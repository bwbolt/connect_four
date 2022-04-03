require './lib/game'
class Turn
  attr_reader :board

  def initialize(board, rules, player1, player2)
    @board = board
    @rules = rules
    @player1 = player1
    @player2 = player2
    @game = Game.new
  end

  def human_turn(player)
    p "#{player.name} please enter position to place an #{player.token}"
    print '>'
    input = gets.chomp.downcase
    until   %w[a b c d e f g].include?(input) && @board.board[input][-1] == '.'
      p "#{player.name} please enter a valid position"
      print '>'
      input = gets.chomp.downcase
    end
    @board.board[input].sub!('.', player.token)
  end

  def computer_turn
    options = %w[a b c d e f g]
    random = options.shuffle
    random = options.shuffle until @board.board[random[0]][-1] == '.'

    @board.board[random[0]].sub!('.', 'O')
  end

  def human_move(player)
    @rules.recycle_winners
    human_turn(player)
    @board.print_board
    @rules.recycle_winners
    if @rules.winner?(player.token)
      p "#{player.name} is the Winner!!!"
      @game.print_main_menu
      exit
    end
  end

  def computer_move
    computer_turn
    @board.print_board
    @rules.recycle_winners
    if @rules.winner?('O')
      p 'The almighty computer has won...'
      @game.print_main_menu
      exit
    end
  end
end
