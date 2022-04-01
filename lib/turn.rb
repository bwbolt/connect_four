class Turn
  attr_reader :board

  def initialize(board)
    @board = board
  end

  # require 'pry' ; binding.pry
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
end
